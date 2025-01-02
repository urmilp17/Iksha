import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iksha/colours.dart';
import 'articlemodal.dart';
import 'articletile.dart';
import 'comment.dart'; // Import the comment page created earlier

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  final int itemsPerPage = 10;
  int currentPage = 1;
  List<Article> displayedArticles = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadInitialArticles();
  }

  Future<void> _loadInitialArticles() async {
    setState(() {
      isLoading = true;
    });
    final articles = await fetchArticles();
    setState(() {
      displayedArticles = articles.take(itemsPerPage).toList();
      isLoading = false;
    });
  }

  Future<List<Article>> fetchArticles() async {
    try {
      final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('article').get();

      return snapshot.docs.map((doc) => Article.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching articles: $e');
      return [];
    }
  }

  Future<void> _loadMoreArticles() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    final articles = await fetchArticles();

    setState(() {
      final startIndex = displayedArticles.length;
      final endIndex = startIndex + itemsPerPage;
      displayedArticles = articles.take(endIndex).toList();
      currentPage++;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'Articles',
          style: TextStyle(
              fontFamily: "Eczar", fontSize: 28, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: isLoading && displayedArticles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
        onRefresh: _loadMoreArticles,
        child: ListView.builder(
          itemCount: displayedArticles.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == displayedArticles.length) {
              return const Center(child: CircularProgressIndicator());
            }
            final article = displayedArticles[index];
            return ArtiTitle(article: article);
          },
        ),
      ),
    );
  }
}

class ArtiTitle extends StatelessWidget {
  const ArtiTitle({
    super.key,
    required this.article,
  });

  final Article article;

  Future<void> _incrementViewCount(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in.')),
      );
      return;
    }

    final articleRef =
    FirebaseFirestore.instance.collection('article').doc(article.id);

    final snapshot = await articleRef.get();
    final data = snapshot.data() as Map<String, dynamic>;

    if (data['viewedBy'] != null &&
        (data['viewedBy'] as List).contains(user.uid)) {
      return;
    }

    await articleRef.update({
      'views': FieldValue.increment(1),
      'viewedBy': FieldValue.arrayUnion([user.uid]),
    });
  }

  Future<void> _toggleLike(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in.')),
      );
      return;
    }

    final articleRef =
    FirebaseFirestore.instance.collection('article').doc(article.id);

    final snapshot = await articleRef.get();
    final data = snapshot.data() as Map<String, dynamic>;

    final likedBy = data['likedBy'] ?? [];
    if ((likedBy as List).contains(user.uid)) {
      await articleRef.update({
        'likes': FieldValue.increment(-1),
        'likedBy': FieldValue.arrayRemove([user.uid]),
      });
    } else {
      await articleRef.update({
        'likes': FieldValue.increment(1),
        'likedBy': FieldValue.arrayUnion([user.uid]),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return GestureDetector(
      onTap: () async {
        await _incrementViewCount(context);

        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ArticleDetailPage(article: article),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Start from right
              const end = Offset.zero; // End at original position
              const curve = Curves.easeInToLinear;

              var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(article.photoUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              article.title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Eczar"),
            ),
            const SizedBox(height: 8),
            Text(
              article.content,
              style: const TextStyle(
                  fontSize: 12, color: Colors.black87, fontFamily: "Eczar"),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // First Row: Date, Views, Likes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      article.date,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "Eczar"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      article.views.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "Eczar"),
                    ),
                    const SizedBox(width: 12),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('article')
                          .doc(article.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || user == null) {
                          return Row(
                            children: [
                              Icon(Icons.thumb_up,
                                  size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(
                                article.likes.toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontFamily: "Eczar"),
                              ),
                            ],
                          );
                        }

                        final data =
                        snapshot.data?.data() as Map<String, dynamic>;
                        final likedBy = data['likedBy'] ?? [];
                        final isLiked = (likedBy as List).contains(user.uid);

                        return GestureDetector(
                          onTap: () => _toggleLike(context),
                          child: Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 16,
                                color: isLiked ? Colors.blue : Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                data['likes'].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontFamily: "Eczar"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Divider (Horizontal Line)
            const Divider(
              color: Colors.grey,
              thickness: 1,
              height: 20,
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommentPage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.comment, size: 16, color: Colors.orange),
                  SizedBox(width: 4),
                  Text(
                    "Comments",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange,
                        fontFamily: "Eczar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

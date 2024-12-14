import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'articlemodal.dart';
import 'articletile.dart';

class ArticlesPage extends StatefulWidget {
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
      // Reference to the 'articles' collection in Firestore
      final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('article').get();

      // Map the Firestore documents to a list of Article objects
      return snapshot.docs.map((doc) => Article.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching articles: $e');
      return [];
    }
  }

  Future<void> _loadMoreArticles() async {
    if (isLoading) return; // Prevent multiple simultaneous loads

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1)); // Simulate API delay
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
      appBar: AppBar(title: const Text('Articles')),
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

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(article.photoUrl, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(article.title),
      subtitle: Text(article.date),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(article: article),
          ),
        );
      },
    );
  }
}

class ArtiTitle extends StatelessWidget {
  const ArtiTitle({super.key, required this.article,});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        final articleRef = FirebaseFirestore.instance.collection('article').doc(article.id);
        await articleRef.update({'views': FieldValue.increment(1)});

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(article: article),
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
                fontFamily: "Eczar"
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article.content,
              style: const TextStyle(fontSize: 12, color: Colors.black87, fontFamily: "Eczar"),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      article.date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: "Eczar"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('article')
                          .doc(article.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            'Error',
                            style: const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: "Eczar"),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text(
                            article.views.toString(),
                            style: const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: "Eczar"),
                          );
                        }

                        final updatedViews = snapshot.data?.get('views') ?? article.views;

                        return Text(
                          updatedViews.toString(),
                          style: const TextStyle(fontSize: 12, color: Colors.grey, fontFamily: "Eczar"),
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.thumb_up, size: 16, color: Colors.grey, ),
                    const SizedBox(width: 4),
                    Text(
                      article.likes.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.grey,fontFamily: "Eczar"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


Widget buildArticleCard({
  required String imagePath,
  required String title,
  required String content,
  required String date,
  required String views,
  required String likes,
}) {
  return Container(
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
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  views,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(width: 12),
                Text(
                  likes,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

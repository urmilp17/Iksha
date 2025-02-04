import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Articles/comments.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'articlemodal.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currentLocale = Localizations.localeOf(context).languageCode;
    final user = FirebaseAuth.instance.currentUser;
    String getText(String locale, String engText, String hindText) {
      return locale == 'hi' ? hindText : engText;
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

    return Scaffold(
      appBar: AppBar(title: const Text(" ")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  article.photoUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 200),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                getText(currentLocale, article.title, article.titleHindi),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Eczar"),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('article')
                            .doc(article.id)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Text('...');
                          }
                          if (!snapshot.hasData || snapshot.data == null) {
                            return const Text('0');
                          }

                          final data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          final commentsCount = data['commentsCount'] ?? 0;
                          final likes = data['likes'] ?? 0;
                          final views = data['views'] ?? 0;

                          return Row(
                            children: [
                              const Icon(Icons.comment,
                                  size: 18, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text('$commentsCount',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "Eczar")),
                              const SizedBox(width: 16),
                              StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('article')
                                    .doc(article.id)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData || user == null) {
                                    return Row(
                                      children: [
                                        const Icon(Icons.thumb_up,
                                            size: 18, color: Colors.grey),
                                        const SizedBox(width: 4),
                                        Text(
                                          article.likes.toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontFamily: "Eczar"),
                                        ),
                                      ],
                                    );
                                  }

                                  final data = snapshot.data?.data()
                                      as Map<String, dynamic>;
                                  final likedBy = data['likedBy'] ?? [];
                                  final isLiked =
                                      (likedBy as List).contains(user.uid);

                                  return GestureDetector(
                                    onTap: () => _toggleLike(context),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.thumb_up,
                                          size: 18,
                                          color: isLiked
                                              ? Colors.blue
                                              : Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          data['likes'].toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey,
                                              fontFamily: "Eczar"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 14),
                              const Icon(Icons.visibility,
                                  size: 18, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text('$views',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "Eczar")),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    getText(currentLocale, article.date, article.dateHindi),
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 16, fontFamily: "Eczar"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CommentsPage(article: article),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0); // Start from right
                        const end = Offset.zero; // End at original position
                        const curve = Curves.easeInToLinear;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
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
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: background),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          localizations?.comments ?? "Comments",
                          style: TextStyle(
                              fontFamily: "Eczar",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        Icon(Icons.comment)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('article')
                    .doc(article.id)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data == null) {
                    return const Text(
                      'Content not available',
                      style: TextStyle(
                          fontSize: 16, fontFamily: "Eczar", height: 1.5),
                    );
                  }

                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  final content = getText(currentLocale, article.content,
                              article.contentHindi)
                          .replaceAll("\\n", "\n") ??
                      '';

                  return ReadMoreText(content: content);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String content;

  const ReadMoreText({super.key, required this.content});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final words = widget.content.split(' ');
    final isLongContent = words.length > 150;

    // Show only the first 200 words if not expanded
    final displayedContent = _isExpanded
        ? widget.content
        : words.take(150).join(' ') + (isLongContent ? '...' : '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayedContent,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Eczar",
            height: 1.5,
          ),
        ),
        if (isLongContent)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Read Less' : 'Read More',
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Eczar",
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}

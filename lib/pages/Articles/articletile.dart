import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/pages/Articles/articles1.dart';
import 'articlemodal.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
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
                article.title,
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
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Text('...');
                          }
                          if (!snapshot.hasData || snapshot.data == null) {
                            return const Text('0');
                          }

                          final data = snapshot.data!.data() as Map<String, dynamic>;
                          final commentsCount = data['commentsCount'] ?? 0;
                          final likes = data['likes'] ?? 0;
                          final views = data['views'] ?? 0;

                          return Row(
                            children: [
                              const Icon(Icons.comment, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text('$commentsCount',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontFamily: "Eczar")),
                              const SizedBox(width: 16),
                              const Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text('$likes',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontFamily: "Eczar")),
                              const SizedBox(width: 16),
                              const Icon(Icons.visibility, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text('$views',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontFamily: "Eczar")),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    article.date,
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 16, fontFamily: "Eczar"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: (){
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
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: background
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Comments",
                          style: TextStyle(fontFamily: "Eczar",fontWeight: FontWeight.w500, fontSize: 16),
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
                      style: TextStyle(fontSize: 16, fontFamily: "Eczar", height: 1.5),
                    );
                  }

                  final data = snapshot.data!.data() as Map<String, dynamic>;
                  final content = data['content']?.replaceAll("\\n", "\n") ?? '';

                  return Text(
                    content,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "Eczar",
                      height: 1.5,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

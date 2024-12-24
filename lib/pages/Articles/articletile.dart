import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';

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
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 200),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                article.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: "Eczar"),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.date,
                    style: const TextStyle(color: Colors.grey, fontSize: 14, fontFamily: "Eczar"),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.visibility, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('${article.views} views', style: const TextStyle(color: Colors.grey, fontSize: 14, fontFamily: "Eczar")),
                      const SizedBox(width: 16),
                      const Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('${article.likes} likes', style: const TextStyle(color: Colors.grey, fontSize: 14, fontFamily: "Eczar")),
                      
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                article.content.replaceAll("\\n", "\n"),
                style: const TextStyle(fontSize: 16, fontFamily: "Eczar",height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

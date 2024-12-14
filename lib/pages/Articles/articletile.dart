import 'package:flutter/material.dart';

import 'articlemodal.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" ")),
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
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 200),
                ),
              ),
              SizedBox(height: 16),
              Text(
                article.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: "Eczar"),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.date,
                    style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: "Eczar"),
                  ),
                  Row(
                    children: [
                      Icon(Icons.visibility, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('${article.views} views', style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: "Eczar")),
                      SizedBox(width: 16),
                      Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('${article.likes} likes', style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: "Eczar")),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                article.content.replaceAll("\\n", "\n"),
                style: TextStyle(fontSize: 16, fontFamily: "Eczar",height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

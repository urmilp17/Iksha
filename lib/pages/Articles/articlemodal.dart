import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String photoUrl;
  final String title;
  final String date;
  final String content;
  final int views;
  final int likes;
  final String id;
  final int commentsCount;
  final int articleNo;

  Article({
    required this.photoUrl,
    required this.title,
    required this.date,
    required this.content,
    required this.views,
    required this.likes,
    required this.id,
    required this.commentsCount,
    required this.articleNo
  });

  factory Article.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Article(
      photoUrl: data['photoUrl'] ?? '',
      title: data['title'] ?? '',
      date: data['date'] ?? '',
      content: data['content'] ?? '',
      views: data['views'] ?? 0,
      likes: data['likes'] ?? 0,
      commentsCount: data['commentsCount'] ?? 0,
      articleNo: data['articleNo'] ?? 0,
      id: doc.id,
    );
  }
}

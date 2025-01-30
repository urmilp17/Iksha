import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String photoUrl;
  final String title;
  final String titleHindi;
  final String date;
  final String dateHindi;
  final String content;
  final String contentHindi;
  final int views;
  final int likes;
  final String id;
  final int commentsCount;
  final int articleNo;

  Article({
    required this.photoUrl,
    required this.title,
    required this.titleHindi,
    required this.date,
    required this.dateHindi,
    required this.content,
    required this.contentHindi,
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
      titleHindi: data['titleHindi'] ?? '',
      date: data['date'] ?? '',
      dateHindi: data['dateHindi'] ?? '',
      content: data['content'] ?? '',
      contentHindi: data['contentHindi'] ?? '',
      views: data['views'] ?? 0,
      likes: data['likes'] ?? 0,
      commentsCount: data['commentsCount'] ?? 0,
      articleNo: data['articleNo'] ?? 0,
      id: doc.id,
    );
  }
}

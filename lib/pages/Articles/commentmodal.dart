import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id;
  final String text;
  final int likes;
  final int repliesCount;
  final Timestamp timestamp;

  Comment({
    required this.id,
    required this.text,
    required this.likes,
    required this.repliesCount,
    required this.timestamp,
  });

  // Convert Firestore document to Comment object
  factory Comment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Comment(
      id: doc.id,
      text: data['text'] ?? '',
      likes: data['likes'] ?? 0,
      repliesCount: data['repliesCount'] ?? 0,
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  // Convert Comment object to Firestore-compatible map
  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'likes': likes,
      'repliesCount': repliesCount,
      'timestamp': timestamp,
    };
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'articlemodal.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CommentPage(),
    );
  }
}

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();

  void _addComment(String commentText) async {
    if (commentText.trim().isEmpty) return;

    await FirebaseFirestore.instance.collection('comments').add({
      'text': commentText,
      'timestamp': FieldValue.serverTimestamp(),
      'likes': 0,
      'repliesCount': 0,
    });

    _commentController.clear();
  }

  void _likeComment(String commentId, int currentLikes) async {
    await FirebaseFirestore.instance.collection('comments').doc(commentId).update({
      'likes': currentLikes + 1,
    });
  }

  void _addReply(String commentId, String replyText) async {
    if (replyText.trim().isEmpty) return;

    await FirebaseFirestore.instance.collection('replies').add({
      'commentId': commentId,
      'text': replyText,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Update replies count in the parent comment
    DocumentSnapshot commentDoc =
    await FirebaseFirestore.instance.collection('comments').doc(commentId).get();
    int currentRepliesCount = commentDoc['repliesCount'];

    await FirebaseFirestore.instance.collection('comments').doc(commentId).update({
      'repliesCount': currentRepliesCount + 1,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('comments')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final comments = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    final commentId = comment.id;
                    final commentData = comment.data() as Map<String, dynamic>;

                    return CommentTile(
                      commentId: commentId,
                      commentData: commentData,
                      onReply: (replyText) => _addReply(commentId, replyText),
                      onLike: () =>
                          _likeComment(commentId, commentData['likes'] as int),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                      hintText: "Write a comment...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.orange),
                  onPressed: () => _addComment(_commentController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentTile extends StatefulWidget {
  final String commentId;
  final Map<String, dynamic> commentData;
  final Function(String) onReply;
  final VoidCallback onLike;

  const CommentTile({
    required this.commentId,
    required this.commentData,
    required this.onReply,
    required this.onLike,
    Key? key,
  }) : super(key: key);

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  final TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.commentData['text']),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: widget.onLike,
                          child: Text(
                            "${widget.commentData['likes']} likes",
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            _replyController.clear();
                            showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: _replyController,
                                        decoration: const InputDecoration(
                                          hintText: "Write a reply...",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          widget.onReply(_replyController.text);
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Reply"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Reply",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text("${widget.commentData['repliesCount']} replies"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('replies')
                .where('commentId', isEqualTo: widget.commentId)
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }

              final replies = snapshot.data!.docs;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: replies.length,
                itemBuilder: (context, index) {
                  final reply = replies[index];
                  final replyData = reply.data() as Map<String, dynamic>;

                  return Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 4),
                    child: Row(
                      children: [
                        const CircleAvatar(child: Icon(Icons.person), radius: 12),
                        const SizedBox(width: 8),
                        Expanded(child: Text(replyData['text'])),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

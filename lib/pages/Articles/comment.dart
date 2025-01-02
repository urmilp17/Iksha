import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        backgroundColor: Colors.orange,
      ),
      body: CommentSection(),
    );
  }
}

class CommentSection extends StatefulWidget {
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final _commentController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  void _addComment(String comment, [String? parentId]) async {
    if (comment.trim().isEmpty || user == null) return;

    final commentsCollection =
    FirebaseFirestore.instance.collection('comments');

    await commentsCollection.add({
      'text': comment,
      'timestamp': FieldValue.serverTimestamp(),
      'userId': user!.uid,
      'parentId': parentId, // For replies, null for main comments
      'likes': 0,
    });

    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('comments')
                .where('parentId', isEqualTo: null)
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
                  return CommentTile(
                    commentId: comment.id,
                    commentText: comment['text'],
                    timestamp: comment['timestamp'],
                    likes: comment['likes'],
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
    );
  }
}

class CommentTile extends StatefulWidget {
  final String commentId;
  final String commentText;
  final Timestamp? timestamp;
  final int likes;

  const CommentTile({
    required this.commentId,
    required this.commentText,
    required this.timestamp,
    required this.likes,
    super.key,
  });

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  final user = FirebaseAuth.instance.currentUser;

  void _likeComment() async {
    if (user == null) return;

    final commentRef =
    FirebaseFirestore.instance.collection('comments').doc(widget.commentId);

    final snapshot = await commentRef.get();
    final data = snapshot.data() as Map<String, dynamic>;

    final likes = data['likes'] ?? 0;
    commentRef.update({'likes': likes + 1});
  }

  void _addReply(String reply) async {
    if (reply.trim().isEmpty || user == null) return;

    await FirebaseFirestore.instance.collection('comments').add({
      'text': reply,
      'timestamp': FieldValue.serverTimestamp(),
      'userId': user!.uid,
      'parentId': widget.commentId,
      'likes': 0,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.commentText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "${widget.likes} likes",
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: _likeComment,
                          child: const Text(
                            "Like",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                final replyController = TextEditingController();
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: replyController,
                                        decoration: const InputDecoration(
                                          hintText: "Write a reply...",
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          _addReply(replyController.text);
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
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('comments')
                .where('parentId', isEqualTo: widget.commentId)
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox();

              final replies = snapshot.data!.docs;

              return ListView.builder(
                itemCount: replies.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final reply = replies[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            reply['text'],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
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

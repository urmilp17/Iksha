import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iksha/colours.dart';
import 'package:iksha/internet_service.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:provider/provider.dart';
import 'articlemodal.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommentsPage extends StatefulWidget {
  final Article article;

  const CommentsPage({super.key, required this.article});

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  String? userName;
  String? profileurl;
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserName();
    fetchUserProfile();
  }

  Future<void> fetchUserName() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (snapshot.exists) {
          setState(() {
            userName = snapshot['name'];
          });
        }
      }
    } catch (e) {
      print("Error fetching user name: $e");
    }
  }

  Future<void> fetchUserProfile() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (snapshot.exists) {
          setState(() {
            profileurl =
                snapshot['imageUrl'] ?? ''; // Safeguard against null values
          });
        } else {
          print('No user data found for UID: ${user.uid}');
        }
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  Future<void> _addComment(String content) async {
    if (content.isEmpty) return;

    final comment = {
      'content': content,
      'author': userName, // Replace with actual user ID or name
      'timestamp': FieldValue.serverTimestamp(),
      'profileUrl': profileurl,
      'likes': 0,
      'likedBy': []
    };

    try {
      // Get a reference to the Firestore article document
      final articleRef = FirebaseFirestore.instance
          .collection('article')
          .doc(widget.article.id);

      // Run a Firestore transaction
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        // First, read the current commentsCount
        final snapshot = await transaction.get(articleRef);
        int currentCount = 0;

        if (snapshot.exists && snapshot.data() != null) {
          currentCount = snapshot.get('commentsCount') ?? 0;
        }

        // Add the comment
        final commentsCollection = articleRef.collection('comments');
        transaction.set(commentsCollection.doc(), comment);

        // Increment the commentsCount
        transaction.update(articleRef, {'commentsCount': currentCount + 1});
      });

      // Clear the comment text field
      _commentController.clear();
    } catch (e) {
      print('Error adding comment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add comment.')),
      );
    }
  }

  Future<void> _toggleLike(String commentId, bool isLiked) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return; // If the user is not logged in, do nothing.

    final commentRef = FirebaseFirestore.instance
        .collection('article')
        .doc(widget.article.id)
        .collection('comments')
        .doc(commentId);

    try {
      if (isLiked) {
        // If already liked, remove the user from `likedBy` and decrement likes.
        await commentRef.update({
          'likedBy': FieldValue.arrayRemove([user.uid]),
          'likes': FieldValue.increment(-1),
        });
      } else {
        // If not liked, add the user to `likedBy` and increment likes.
        await commentRef.update({
          'likedBy': FieldValue.arrayUnion([user.uid]),
          'likes': FieldValue.increment(1),
        });
      }
    } catch (e) {
      print('Error toggling like: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to update like status.')),
      );
    }
  }

  Widget _commmentile({
    required String author,
    required String content,
    required String profileUrl,
    required String timeAgo,
    required int likes,
    required bool likedBy,
    required String commentId,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Picture
          CircleAvatar(
            backgroundImage: profileUrl.isNotEmpty
                ? NetworkImage(profileUrl)
                : AssetImage('assets/default_avatar.png') as ImageProvider,
            radius: 20,
          ),
          const SizedBox(width: 10),
          // Comment Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      author,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Eczar"),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: "Eczar"),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  content,
                  style: const TextStyle(
                      fontSize: 14, color: Colors.black, fontFamily: "Eczar"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Like Button
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _toggleLike(commentId, likedBy); // Call the toggle function
                },
                child: Icon(
                  likedBy ? Icons.favorite : Icons.favorite_border,
                  color: likedBy ? Colors.pink : Colors.grey,
                  size: 20,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$likes',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;

    return isConnectedToInternet
        ? Scaffold(
            appBar: AppBar(
              title: const Text(""),
              backgroundColor: background,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('article')
                          .doc(widget.article.id)
                          .collection('comments')
                          .orderBy('timestamp', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Error loading comments'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        final comments = snapshot.data?.docs ?? [];
                        final user = FirebaseAuth.instance.currentUser;

                        if (comments.isEmpty) {
                          return Center(
                            child: Text(
                              localizations?.no_comment ??
                                  'No comments yet. Be the first!',
                              style: TextStyle(fontFamily: "Eczar"),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            final comment = comments[index];
                            final content = comment['content'] ?? '';
                            final author = comment['author'] ?? 'Anonymous';
                            final profileUrl = comment['profileUrl'] ??
                                ''; // Add this to Firestore
                            final timestamp =
                                (comment['timestamp'] as Timestamp?)?.toDate();
                            final likes = comment['likes'];
                            final likedBy = comment['likedBy'] ?? [];
                            final isLiked =
                                (likedBy as List).contains(user?.uid ?? "");
                            final commentId = comment.id;

                            final timeAgo = timestamp != null
                                ? timeago.format(timestamp)
                                : 'Unknown time';

                            return _commmentile(
                              author: author,
                              content: content,
                              profileUrl: profileUrl,
                              timeAgo: timeAgo,
                              likes: likes,
                              likedBy: isLiked,
                              commentId: commentId,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 2, 10, 2),
                      child: TextField(
                        controller: _commentController,
                        style: const TextStyle(fontFamily: 'Eczar'),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _addComment(_commentController.text);
                            },
                            child: Icon(
                              Icons.send,
                              color: iconcolor,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText:
                              localizations?.add_comment ?? "Add a comment...",
                          hintStyle: const TextStyle(
                              fontFamily: 'Eczar', fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wifi_off, // No connection icon
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                   Text(
                    localizations?.no_internet??'No Wifi or Cellular Data',
                    style: TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    localizations?.n_cmt??'Unable to load articles.\nPlease check your connection and try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Eczar',
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final settings = OpenSettingsPlus.shared;
                          if (settings is OpenSettingsPlusAndroid) {
                            settings.wifi();
                          } else if (settings is OpenSettingsPlusIOS) {
                            settings.wifi();
                          } else {
                            throw Exception('Platform not supported');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ), // Exits the app
                        child: const Text(
                          'Settings',
                          style: TextStyle(fontFamily: 'Eczar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

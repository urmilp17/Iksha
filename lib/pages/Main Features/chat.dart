import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import for animations

import 'package:iksha/colours.dart';

class AskQuestion extends StatefulWidget {
  const AskQuestion({super.key});

  @override
  State<AskQuestion> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  final TextEditingController _questionController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  String? userName;
  String? profileurl;
  final List<Map<String, dynamic>> _messages =
      []; // Store chat messages with animation flag
  bool _isLoading = false;
  int _animatedIndex = -1;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
    fetchUserName();
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

  Future<void> fetchAnswer(String question) async {
    const String apiUrl = "http://192.168.0.102:8000/ask";

    setState(() {
      _isLoading = true;
      _messages
          .add({"sender": "user", "message": question, "isAnimated": false});
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'question': question}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        setState(() {
          _messages.add({
            "sender": "ai",
            "message": responseData['answer'] ?? "No answer received.",
            "isAnimated": true
          });
        });
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        setState(() {
          _messages.add({
            "sender": "ai",
            "message": errorData['detail'] ?? "An error occurred.",
            "isAnimated": true
          });
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({
          "sender": "ai",
          "message": "Failed to connect: $e",
          "isAnimated": true
        });
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildMessageBubble(String message, bool isUser, bool isAnimated, int index) {
    final shouldAnimate = isAnimated && index == _animatedIndex;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUser) // AI avatar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: background,
              backgroundImage: const AssetImage("assets/images/Logo.png"),
              radius: 20,
            ),
          ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isUser ? background : Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: isUser
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
                bottomRight: isUser
                    ? const Radius.circular(0)
                    : const Radius.circular(12),
              ),
            ),
            child: shouldAnimate
                ? AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  message,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: isUser ? iconcolor : Colors.black87,
                    fontFamily: 'Eczar',
                  ),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: () {
                // Mark animation as complete
                setState(() {
                  _messages[_messages.length - 1 - index]['isAnimated'] = false;
                  _animatedIndex = _animatedIndex - 1; // Move to next message
                });
              },
            )
                : Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: isUser ? iconcolor : Colors.black87,
                fontFamily: 'Eczar',
              ),
            ),
          ),
        ),
        if (isUser) // User avatar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: profileurl != null && profileurl!.isNotEmpty
                  ? NetworkImage(profileurl!)
                  : const AssetImage('assets/images/ach.jpg') as ImageProvider,
            ),
          ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prashna Uttari",
          style: TextStyle(
              fontFamily: 'LibreBaskerville', fontWeight: FontWeight.bold),
        ),
        backgroundColor: background,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Messages stack from bottom to top
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                final isUser = message['sender'] == 'user';
                return _buildMessageBubble(
                  message['message'],
                  isUser,
                  message['isAnimated'] ?? false,
                  index,
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Text("AI is typing...", style: TextStyle(color: Colors.grey,fontFamily: 'Eczar')),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: background, borderRadius: BorderRadius.circular(32),),
              child: TextField(
                controller: _questionController,
                style: const TextStyle(fontFamily: 'Eczar'),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      final question = _questionController.text.trim();
                      if (question.isNotEmpty) {
                        fetchAnswer(question);
                        _questionController.clear();
                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: iconcolor,
                      size: 30,
                    ),
                  ),
                  hintText: "Type your message...",
                  hintStyle: const TextStyle(fontFamily: 'Eczar'),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

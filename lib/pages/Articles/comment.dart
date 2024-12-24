import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iksha/colours.dart';

void main() => runApp(CommentPageApp());

class CommentPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommentPage(),
    );
  }
}

class CommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                Text(
                  'user1',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                // Comment text
                Text(
                  'opkl',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                // Icons and counts
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 4),
                        Text('1'),
                      ],
                    ),
                    SizedBox(width: 16),
                    Row(
                      children: [
                        Icon(Icons.comment, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('0'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

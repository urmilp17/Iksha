import 'package:flutter/material.dart';

class SampradayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Sampraday Page', style: TextStyle(fontFamily: 'Eczar')),
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.account_circle),
      //       onPressed: () {
      //         // Navigate to the profile page or show a profile dialog
      //       },
      //     ),
      //   ],
      //   backgroundColor: Colors.deepOrange,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Icon(Icons.keyboard_backspace)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/images/img1.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Sampraday',
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sampraday is a community-focused platform that aims to connect like-minded individuals and promote cultural values. Join us to be a part of an ever-growing community.',
              style: TextStyle(
                fontFamily: 'Eczar',
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Action for joining the community
                  },
                  icon: const Icon(Icons.group_add),
                  label: const Text('Join Now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontFamily: 'Eczar'),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    // Action for learning more
                  },
                  icon: const Icon(Icons.info),
                  label: const Text('Learn More'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepOrange,
                    textStyle: const TextStyle(fontFamily: 'Eczar'),
                    side: const BorderSide(color: Colors.deepOrange),
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

void main() {
  runApp(MaterialApp(
    home: SampradayPage(),
  ));
}

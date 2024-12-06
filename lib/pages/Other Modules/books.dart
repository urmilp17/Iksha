import 'package:flutter/material.dart';

import 'bookpdf.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  static  List<Map<String, dynamic>> interests = [
    {
      'title': 'The Testaments',
      'author': 'Margaret Atwood',
      'image': 'assets/images/book1.jpg',
      'page': BookDetailsPage(),
    },
    {
      'title': 'Daisy Jones',
      'author': 'Taylor Jenkins Reid',
      'image': 'assets/images/book2.jpg',
    },
  ];

  static const List<Map<String, String>> exploreBooks = [
    {
      'title': 'Fleishman Is In Trouble',
      'author': 'Taffy Brodesser-Akner',
      'image': 'assets/images/book3.jpg',
    },
    {
      'title': 'Trust Exercise',
      'author': 'Susan Choi',
      'image': 'assets/images/book4.jpg',
    },
    {
      'title': 'The Topeka School',
      'author': 'Ben Lerner',
      'image': 'assets/images/book5.jpg',
    },
    {
      'title': 'American Spy',
      'author': 'Lauren Wilkinson',
      'image': 'assets/images/book6.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      //Make changes from here
      body: Text("Changes to be done"),
    );
  }

  Widget _buildExploreTab(List<Map<String, String>> books) {
    return GridView.builder(
      itemCount: books.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  books[index]['image']!,
                  fit: BoxFit.cover,
                  width: 150, // Ensure image fills the width
                  height: 200, // Consistent height with interests
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              books[index]['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(books[index]['author']!),
          ],
        );
      },
    );
  }
}

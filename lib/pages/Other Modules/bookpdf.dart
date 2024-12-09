import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsPage extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Logo Design Love: A Guide to Creating Iconic Brand Identities',
      author: 'David Airey',
      price: '\$9.99',
      image: 'assets/images/book2.jpg', // Replace with your image asset
      driveUrl: 'https://drive.google.com/file/d/1uftD6RdGaSRSWaH0HVQbTxrGIkO_nf7X/view?usp=sharing',
      pages: 216,
      description:
      'In Logo Design Love, David shows you how to develop an iconic brand identity from start to finish, '
          'using client case studies from renowned designers. In the process, he reveals how designers create '
          'effective briefs, generate ideas, charge for their work, and collaborate with clients.',
    ),
    Book(
      title: 'The Design of Everyday Things',
      author: 'Don Norman',
      price: '\$12.99',
      image: 'assets/images/book1.jpg', // Replace with your image asset
      driveUrl: 'https://drive.google.com/file/d/185uAUxDAmvBPMeQrX3XPDFFtRELv4Oyq/view?usp=sharing',
      pages: 368,
      description:
      'A brilliant examination of everyday objects, uncovering why some designs work while others fail. '
          'Don Norman explains how intuitive design impacts our daily lives and what we can learn from it.',
    ),
  ];

  Future<void> _launchDriveFolder(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text(
          'Design Books',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          book.image,
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'by ${book.author}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              book.price,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: const [
                                Icon(Icons.star, color: Colors.amber, size: 20.0),
                                Icon(Icons.star, color: Colors.amber, size: 20.0),
                                Icon(Icons.star, color: Colors.amber, size: 20.0),
                                Icon(Icons.star, color: Colors.amber, size: 20.0),
                                Icon(Icons.star_half, color: Colors.amber, size: 20.0),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${book.pages} pages',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () => _launchDriveFolder(book.driveUrl),
                        child: const Text('READ NOW'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.pink,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    book.description,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String price;
  final String image;
  final String driveUrl;
  final int pages;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.price,
    required this.image,
    required this.driveUrl,
    required this.pages,
    required this.description,
  });
}

void main() {
  runApp(MaterialApp(
    home: BookDetailsPage(),
  ));
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';


class Books extends StatefulWidget {
  const Books({super.key});

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  final List<Book> books = const [
    Book(
      title: 'Logo Design Love: A Guide to Creating Iconic Brand Identities',
      author: 'David Airey',
      price: '\$9.99',
      image: 'assets/images/book2.jpg',
      driveUrl: 'https://drive.google.com/uc?export=download&id=1uftD6RdGaSRSWaH0HVQbTxrGIkO_nf7X',
      pages: 216,
      description: 'In Logo Design Love, David shows you how to develop an iconic brand identity from start to finish.',
    ),
    Book(
      title: 'The Design of Everyday Things',
      author: 'Don Norman',
      price: '\$12.99',
      image: 'assets/images/book1.jpg',
      driveUrl: 'https://drive.google.com/uc?export=download&id=185uAUxDAmvBPMeQrX3XPDFFtRELv4Oyq',
      pages: 368,
      description: 'A brilliant examination of everyday objects, uncovering why some designs work while others fail.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    FlutterDownloader.initialize(debug: true);
    _requestPermissions();
  }

  // Request permissions for downloading files
  void _requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Permissions granted
    } else {
      print('Permission to access storage denied');
    }
  }

  // Function to launch PDF in a browser or viewer
  Future<void> _openPdf(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open $url';
    }
  }

  // Function to download the PDF file
  Future<void> _downloadFile(String url, String fileName) async {
    try {
      // Get the external storage directory
      final directory = await getExternalStorageDirectory();
      if (directory == null) {
        throw Exception("Failed to get storage directory.");
      }

      final savedDir = directory.path;

      // Enqueue the download task
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: savedDir,
        fileName: fileName,
        showNotification: true, // Show download progress notification
        openFileFromNotification: true, // Open file after download
      );
      print("Download started with taskId: $taskId");
    } catch (e) {
      print("Error downloading file: $e");
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
                        onPressed: () => _openPdf(book.driveUrl),
                        child: const Text('READ NOW'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () => _downloadFile(book.driveUrl, '${book.title}.pdf'),
                        child: const Text('DOWNLOAD'),
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

  const Book({
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
  runApp(const MaterialApp(
    home: Books(),
  ));
}

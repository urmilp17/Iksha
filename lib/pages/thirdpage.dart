import 'package:flutter/material.dart';
import 'dart:math';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<Map<String, String?>> articles = [
    {
      'imagePath': 'assets/images/article1.png',
      'title': 'Hindus being targeted in Bangladesh, need unity to fight threat to Sanatan Dharma: Adityanath',
      'date': '26/07/24',
      'content': 'Hindus are being selectively targeted in Bangladesh, Uttar Pradesh Chief Minister Yogi Adityanath alleged on Wednesday and called for unity to fight the threat against Sanatan Dharma. He also said construction of the Ram temple in Ayodhya was not a destination but a milestone...',
    },
    {
      'imagePath': 'assets/images/article2.png',
      'title': 'Congress giving silent approval to those abusing Sanatan Dharma',
      'date': '26/07/24',
      'content': 'The Congress party is accused of giving silent approval to those who abuse Sanatan Dharma. This has sparked outrage among various groups who believe that this undermines the cultural and religious fabric of the country...',
    },
    {
      'imagePath': 'assets/images/article3.png',
      'title':"In Kurukshetra, Arvind Kejriwal says Lok Sabha polls battle between'dharma vs adharma'",
      'date': '26/07/24',
      'content': "Delhi chief minister and Aam Aadmi Party convener Arvind Kejriwal on Sunday invoked the Hindu epic Mahabharata and described the coming general elections as a fight between “dharma” and “adharma”...It is the fight between dharma' and 'adharma'. We know that Pandavas won but Kauravas had everything...Pandavas had lord Krishna with them. What do we have with us? We are also very small but we have lord Krishna with us,” Kejriwal said while addressing a public gathering in Haryanas Kurukshetra ..",
    },
    {
      'imagePath': 'assets/images/article5.png',
      'title': "Bhagavad Gita for Humanity, Dharma & Religion: new papers likely at DU's Hindu Studies Centre",
      'date': '26/07/24',
      'content': "The Delhi University's Centre for Hindu Studies is proposing to introduce six new elective papers including Introduction to Vedic Literature, Upanishad Parichaya, Dharma and Religion, Bhagavad Gita for Humanity, Hindu Thinkers, and Purana Parichaya. These aim to provide students with a comprehensive understanding of Hinduism and align with their needs, pending approval from the Academic Council....",
    },
    {
      'imagePath': 'assets/images/article4.png',
      'title': 'Dmk opposition to Sanatan Dharma hurt Tamils:Amit shah',
      'date': '26/07/24',
      'content': "Shah claimed rampant corruption by DMK and AIADMK had hindered the development of Tamil Nadu. Shah urged the people to abandon both parties and strengthen PM Modi's leadership by voting for BJP....According to Shah, PM Modi has made the country secure and prosperous and elevated the pride of Tamil Nadu, Tamil language and Tamil culture across the country and the world. ",
    },
    {
      'imagePath': 'assets/images/img6.jpeg',
      'title': 'Lorem ipsum dolor sit amet',
      'date': '26/07/24',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Articles")),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            articles.shuffle(Random());
          });
        },
        child: SingleChildScrollView(
          child: Column(
            children: articles.map((article) {
              return buildArticle(
                imagePath: article['imagePath'] ?? '',
                title: article['title'] ?? '',
                date: article['date'] ?? '',
                content: article['content'] ?? '',
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildArticle({required String imagePath, required String title, required String date, required String content}) {
    List<String> titleWords = title.split(' ');
    String displayedTitle = titleWords.take(5).join(' ');

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16), // Padding inside the container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0), // Border radius for the container
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(
                imagePath: imagePath,
                title: title,
                content: content,
              ),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0), // Border radius for the image
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16), // Increased space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          displayedTitle, // Display truncated title
                          style: TextStyle(fontFamily: 'Ezcar', fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop(); // Close the dialog
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ArticleDetailPage(
                                          imagePath: imagePath,
                                          title: title,
                                          content: content,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0), // Border radius for the image
                                        child: Image.asset(
                                          imagePath,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black, // Title color set to black
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          ' more',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      date,
                      style: TextStyle(fontFamily: 'Ezcar', fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;

  const ArticleDetailPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article Details"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0), // Border radius for the image
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: 200, // Adjust height as needed
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Ezcar',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black, // Title color set to black
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//Done Testing
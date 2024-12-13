import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  int? expandedIndex;
  TextEditingController commentController = TextEditingController();
  Stopwatch stopwatch = Stopwatch();

  // Add individual comments list for each article
  List<List<Map<String, dynamic>>> articleComments = List.generate(
    articles.length,
        (_) => [],
  );

  static List<Map<String, dynamic>> articles = [
    {
      'imagePath': 'assets/images/article1.jpg',
      'title': 'Origin of Ganesha',
      'content': "Like all gods in the Hindu pantheon, Ganesh has a mythological origin...",
      'date': '23 March 23',
      'readTime': '2 sec read',
      'views': 1,
      'likes': 0,
      'isLiked': false,
    },
    {
      'imagePath': 'assets/images/article2.jpeg',
      'title': "What did Sage Narada preach to Prahlada",
      'content': "King Hiranyakashyap leaves to woods to do meditation for Lord Brahma...",
      'date': '26 July 24',
      'readTime': '3 sec read',
      'views': 12,
      'likes': 4,
      'isLiked': false,
    },
    {
      'imagePath': 'assets/images/article3.jpg',
      'title': 'What makes goddess Lakshmi angry?',
      'content': 'The following things make Goddess Lakshmi angry, and she (the epitome of prosperity, happiness, and potential) goes away from home:\n\n'
          '1. Insulting others.\n'
          '2. Insulting holy works, Lord Vishnu, and morals.\n'
          '3. Disrespecting the weak and people with lower status.\n'
          '4. Not keeping the house clean.\n'
          '5. Offering her hot (chilly) or bitter food.\n'
          '6. Disrespecting symbols of prosperity like Swastik, Sindoor, gold, basil, and holy pot.\n'
          '7. Having ego about existing prosperity.\n'
          '8. Not thanking her for gifts like prosperity, power, fortune, and knowledge which she gave you.\n\n'
          'Results if she gets angry:\n\n'
          '1. You will be affected by Alakshmi (the epitome of poverty, hunger, bad luck, laziness, and dirtiness).\n'
          '2. Your luck and fortune will leave you.\n'
          '3. Your prosperity, wealth, and self-confidence will be destroyed.\n'
          '4. You can never achieve success.\n'
          '5. You may have to live a poor life, lacking proper food, money, clothes, etc.',
      'date': '26 July 2024',
      'readTime': '4 sec read',  // Default read time in seconds
      'views': 10,
      'likes': 2,
      'isLiked': false, // Track like state
    },
    {
      'imagePath': 'assets/images/article4.jpg',
      'title': "What happened to Lord Rama's dead body?",
      'content': "When Lord Vishnu come to Earth, He Take Different Forms according to Situation, he never take birth he is unborn when there was nothing lord Vishnu was there alone in formless way, he appear not take birth(when prahalad called lord narsimha appeared from pillar here lord narsimha didn't took birth he appeared and after killing demon Lord Narsimha disappeared)"
          "Hari Vypak Sarvatra Samana prem te pragat hoi Mai Jana, Desh kal videshu mahi kahahu so kha jaha prabhu nahi"
          "Lord Vishnu is immortal he is present everywhere in formless way but when devotees calls the formless god with love, Lord Vishnu take form and appear same with lord Shiva and Mata Durga all are immortal One and Same, The Formless God for love take different forms and do different leelas to give devotees bliss and Joy and attract the eternal fragments(souls) home who are stuck in the 84 lakh different types of body in Material Nature thinking himself as the body not soul and trapped by Maya. The soul is formless eternal and are fragments of God and supreme bliss itself, but stuck in Maya forgotten itself, the formless God take form and attract the lost souls home"
          "he don't go in mother womb which is full of dirt, but still to do roleplay (leela)on earth and to attract the lost souls home he use his yogmaya to make people think he take birth from Mother Womb, but the truth is he is immortal and his body is eternal made of Supreme bliss itself,"
          "When Yamraj came to tell Lord Ram that every living beings are happy and Dharma is 100% again than lord Rama to end his leela go to Saryu river and take a dip inside and took the form of Narayan and Go to Vaikuntha, same with Lord Krishna🙏 and Upcoming Kalki Avatar, Marayada Purushottam bhagwan Shree Ram ki Jai",
      'date': '26 July 2024',
      'readTime': '2 sec read',  // Default read time in seconds
      'views': 3,
      'likes': 15,
      'isLiked': false, // Track like state
    },
    {
      'imagePath': 'assets/images/article5.jpg',
      'title': 'Why is Lord Shiva also called Rudradev?',
      'content': "According to Bhagavata Purana, Lord Brahma originated from Lord Narayana’s navel. Now, Lord Vishnu ordered Lord Brahma to do the task of creation. Brahma created four sons: Sanaka, Sanandana, Sanatsujaata, and Sanatkumaara. These four were the sons of Lord Brahma. Though the look of these four sons of Lord Brahma was like that of a child, they had profound and pure knowledge about the supreme Lord Vishnu. Now, Lord Brahma asked them to continue the task of creation. But, these four kumaras of Lord Brahma refused to do so and said that they didn’t want to fall in the samsara bandhana and wanted to do tapasya and please Lord Narayana.On seeing this, Lord Brahma got angry because his sons were not listening to him. His anger was uncontrollable. Suddenly, a baby emerged out of Lord Brahma’s forehead. The baby started crying aloud. It was crying so loud that the crying sound was unbearable for anyone. The baby was crying because he wanted a name. Now, Lord Brahma got even more angry and cursed the baby that he would be called Rudra. Rudra means ‘one who cries’. Because this baby cried loudly, he is called Rudra. Another meaning of Rudra is ‘one who drives away sorrows’. The etymological meaning of Rudra is ‘one who drives away evil and fear’. He is the ‘destroyer of sorrows and the one who removes",
      'date': '26 July 2024',
      'readTime': '3 min read',  // Default read time in seconds
      'views': 5,
      'likes': 10,
      'isLiked': false, // Track like state
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: expandedIndex != null
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              if (expandedIndex != null) {
                stopwatch.stop();
                final seconds = stopwatch.elapsed.inSeconds;
                String formattedTime;
                if (seconds >= 60) {
                  final minutes = (seconds / 60).floor();
                  final remainingSeconds = seconds % 60;
                  formattedTime = '$minutes min ${remainingSeconds} sec read';
                } else {
                  formattedTime = '$seconds sec read';
                }

                articles[expandedIndex!]['readTime'] = formattedTime;
                articles[expandedIndex!]['views'] += 1;
              }
              expandedIndex = null;
              stopwatch.reset();
            });
          },
        )
            : null,
        title: expandedIndex == null ? const Text('Articles') : null,
      ),
      body: expandedIndex == null
          ? ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                expandedIndex = index;
              });
              stopwatch.start();
            },
            child: buildArticleCard(
              imagePath: articles[index]['imagePath']!,
              title: articles[index]['title']!,
              content: articles[index]['content']!,
              date: articles[index]['date']!,
              readTime: articles[index]['readTime']!,
              views: articles[index]['views'].toString(),
              likes: articles[index]['likes'].toString(),
              isLiked: articles[index]['isLiked']!,
              index: index,
            ),
          );
        },
      )
          : buildExpandedView(articles[expandedIndex!], expandedIndex!),
    );
  }

  Widget buildArticleCard({
    required String imagePath,
    required String title,
    required String content,
    required String date,
    required String readTime,
    required String views,
    required String likes,
    required bool isLiked,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.timer, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    readTime,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    views,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 16,
                      color: isLiked ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        articles[index]['isLiked'] = !isLiked;
                        if (isLiked) {
                          articles[index]['likes'] -= 1;
                        } else {
                          articles[index]['likes'] += 1;
                        }
                      });
                    },
                  ),
                  Text(
                    likes,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.comment, size: 18, color: Colors.orange),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  _showCommentDialog(context, index);
                },
                child: const Text(
                  'Comments',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildExpandedView(Map<String, dynamic> article, int index) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(article['imagePath']!),
                fit: BoxFit.cover,

              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              article['title']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              article['content']!,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(height: 20),
          buildCommentsSection(index),
        ],
      ),
    );
  }

  Widget buildCommentsSection(int articleIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Comments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articleComments[articleIndex].length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  buildCommentCard(articleComments[articleIndex][index]),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildCommentCard(Map<String, dynamic> comment) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, size: 20, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment['username'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    comment['text'],
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat('MMM d, h:mm a').format(comment['time']),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCommentDialog(BuildContext context, int articleIndex) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Comment'),
          content: TextField(
            controller: commentController,
            decoration: const InputDecoration(hintText: 'Enter your comment'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  articleComments[articleIndex].add({
                    'username': 'User', // Placeholder for username
                    'text': commentController.text,
                    'time': DateTime.now(),
                  });
                  commentController.clear();
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

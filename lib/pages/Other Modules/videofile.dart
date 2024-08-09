import 'package:flutter/material.dart';

class VideoPlaylistPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Session 1: Summary of Word Power Made Easy',
      'subtitle': '1.2M views · 4 years ago',
      'thumbnail': 'assets/images/session1.jpg',
      'duration': '23:08',
    },
    {
      'title': 'Session 2: Summary of Word Power Made Easy',
      'subtitle': '331K views · 4 years ago',
      'thumbnail': 'assets/images/session2.jpg',
      'duration': '18:41',
    },
    {
      'title': 'Session 3: Summary of Word Power Made Easy',
      'subtitle': '231K views · 4 years ago',
      'thumbnail': 'assets/images/session3.jpg',
      'duration': '19:45',
    },
    // Add more sessions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('    '),
              background: Image.asset(
                'assets/images/Sri-Jnaneshwar-pi.gif',
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(Icons.cast),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('40 videos', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      Icon(Icons.save_alt),
                      SizedBox(width: 10),
                      Icon(Icons.share),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: Stack(
                    children: [
                      Image.asset(videos[index]['Sri-Jnaneshwar-pi.gif']!, fit: BoxFit.cover),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          color: Colors.black54,
                          padding: EdgeInsets.all(2),
                          child: Text(
                            videos[index]['duration']!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    videos[index]['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(videos[index]['subtitle']!),
                  onTap: () {
                    // Navigate to the video player page
                  },
                );
              },
              childCount: videos.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Library',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

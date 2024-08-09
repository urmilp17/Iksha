import 'package:flutter/material.dart';

class VideoPlaylistPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Session 1: Summary of Word Power Made Easy',
      'subtitle': '1.2M views · 4 years ago',
      'thumbnail': 'assets/images/img1.jpeg',
      'duration': '23:08',
    },
    {
      'title': 'Session 2: Summary of Word Power Made Easy',
      'subtitle': '331K views · 4 years ago',
      'thumbnail': 'assets/images/img2.jpeg',
      'duration': '18:41',
    },
    {
      'title': 'Session 3: Summary of Word Power Made Easy',
      'subtitle': '231K views · 4 years ago',
      'thumbnail': 'assets/images/img3.jpeg',
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
              title: const Text('    '),
              background: Image.asset(
                'assets/images/Sri-Jnaneshwar-pi.gif',
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.cast),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
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
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: Stack(
                    children: [
                      Image.asset(videos[index]['thumbnail']!, fit: BoxFit.fill),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          color: Colors.black54,
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            videos[index]['duration']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    videos[index]['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
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

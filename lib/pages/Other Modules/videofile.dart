import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        fontFamily: 'Roboto',
      ),
      home: VideoPage(),
    );
  }
}

class VideoPage extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      "title": "Explore the Mountains",
      "thumbnail": "https://via.placeholder.com/150",
      "duration": "4:20",
      "subtitle": "A breathtaking journey into nature."
    },
    {
      "title": "City Lights at Night",
      "thumbnail": "https://via.placeholder.com/150",
      "duration": "3:15",
      "subtitle": "Experience the vibrant cityscape."
    },
    {
      "title": "Cooking 101",
      "thumbnail": "https://via.placeholder.com/150",
      "duration": "6:05",
      "subtitle": "Learn the basics of cooking delicious meals."
    },
    {
      "title": "Fitness for Beginners",
      "thumbnail": "https://via.placeholder.com/150",
      "duration": "5:00",
      "subtitle": "Start your fitness journey today!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Gallery"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Thumbnail
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        video["thumbnail"]!,
                        width: 120,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Video Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            video["title"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            video["subtitle"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                "Duration: ${video["duration"]}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.play_arrow,
                                        color: Colors.blueAccent),
                                    onPressed: () {
                                      // Play video
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.favorite_border,
                                        color: Colors.redAccent),
                                    onPressed: () {
                                      // Like video
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.bookmark_border,
                                        color: Colors.green),
                                    onPressed: () {
                                      // Bookmark video
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

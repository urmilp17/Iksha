import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:url_launcher/url_launcher.dart';

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
      "title": "Drig Drishya Viveka",
      "thumbnail": "https://i.ytimg.com/vi/Bxvc4eL3tag/hqdefault.jpg?sqp=-oaymwExCNACELwBSFryq4qpAyMIARUAAIhCGAHwAQH4Af4JgALQBYoCDAgAEAEYZSBOKD8wDw==&rs=AOn4CLBnhkZ3MTyczTL1ZWLlDohsAxHeRQ",
      "duration": "4:20",
      "subtitle": "Dṛg-Dṛśya-Viveka is a text in Advaita Vedanta philosophy that explores the distinction between the “seer” (Dṛg) and the “seen” (Dṛśya)",
      "url": "https://youtube.com/playlist?list=PLDqahtm2vA728mT-GFH6F-vN2YsS1h72x&feature=shared"
    },
    {
      "title": "City Lights at Night",
      "thumbnail": "https://via.placeholder.com/150",
      "duration": "3:15",
      "subtitle": "Experience the vibrant cityscape.",
      "url": "https://www.youtube.com/watch?v=kJQP7kiw5Fk"
    },
    {
      "title": "Cooking 101",
      "thumbnail": "https://via.placeholder.com/150",
      "duration": "6:05",
      "subtitle": "Learn the basics of cooking delicious meals.",
      "url": "https://www.youtube.com/watch?v=e-ORhEE9VVg"
    },
    {
      "title": "Fitness for Beginners",
      "thumbnail": "https://via.placeholder.com/150",
      "duration": "5:00",
      "subtitle": "Start your fitness journey today!",
      "url": "https://www.youtube.com/watch?v=7wtfhZwyrcc"
    },
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Gallery"),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Videotile(video);
        },
      ),
    );
  }

  GestureDetector Videotile(Map<String, String> video) {
    return GestureDetector(
          onTap: () {
            // Open YouTube URL on tap
            _launchURL(video["url"]!);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 120,
                            height: 80,
                            color: Colors.grey,
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.white,
                            ),
                          );
                        },
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
                              fontSize: 15,
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
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Duration: ${video["duration"]}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Icon(
                    //   Icons.play_arrow,
                    //   color: iconcolor,
                    //   size: 30,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}

import 'package:flutter/material.dart';
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
      "Playlist": "12 videos",
      "subtitle": "Dṛg-Dṛśya-Viveka is a text in Advaita Vedanta philosophy that explores the distinction between the “seer” (Dṛg) and the “seen” (Dṛśya)",
      "url": "https://youtube.com/playlist?list=PLDqahtm2vA728mT-GFH6F-vN2YsS1h72x&feature=shared"
    },
    {
      "title": "Shad-darshanas",
      "thumbnail": "https://i.ytimg.com/vi/Y4EAoWru8Kc/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLB8xxDfucLYhUMTaxR-b5v-ySR1xA",
      "Playlist": "6 videos",
      "subtitle": "Six Approaches to Reality",
      "url": "https://youtube.com/playlist?list=PLWjpkY4mU2RDezmqRmC7q0dxqSm2XZj11&feature=shared"
    },
    {
      "title": "Tattvabodha",
      "thumbnail": "https://i.ytimg.com/vi/v5gffvRjtiU/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBKE3lrU5NZfyyHaKFnKrfOJ-Xx-w",
      "Playlist": "16 videos",
      "subtitle": "Tattvabodha is a foundational text in Advaita Vedanta",
      "url": "https://youtube.com/playlist?list=PLWjpkY4mU2RDCG1ODP1T6f7mKb1L69G_-&feature=shared"
    },
    {
      "title": "The Four Yogas",
      "thumbnail": "https://i.ytimg.com/vi/n-SUJ0Vwelk/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDR0OS94uIphzxvvCS7cFeG0Bv-1A",
      "Playlist": "15 videos",
      "subtitle": "Lectures on the four main paths by which a follower can reach moksha, or liberation. ",
      "url": "https://youtube.com/playlist?list=PLDqahtm2vA717IaOZp0s9lZqzwmq-MY5u&feature=shared"
    },

    {
      "title": "Panchadasi by Vidyaranya",
      "thumbnail": "https://i.ytimg.com/vi/X872V8LMFNE/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAvi2QiQOacfpdW7wxnpPrREOB92w",
      "Playlist": "9 videos",
      "subtitle": " it explains the nature of Brahman, the Self, Prakriti, Maya, Avidya, Jiva, Prajna, and the five elements.",
      "url": "https://youtube.com/playlist?list=PLDqahtm2vA71mxVB2YXXi4J8aYVHXL_bE&feature=shared"
    },
    {
      "title": "Foundations of Self Enquiry",
      "thumbnail": "https://i.ytimg.com/vi/kGu9qItLTt8/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLA3IZ_4UHAFx-blhkiH69Szk0Gz9Q",
      "Playlist": "6 videos",
      "subtitle": "Dialogues on the Great Sayings: A Path to Self-Realization",
      "url": "https://youtube.com/playlist?list=PLDqahtm2vA73W7LK13e9K9Uy1rKcKa1ay&feature=shared"
    },
    {
      "title": "Vedantasara of Sadananda",
      "thumbnail": "https://i.ytimg.com/vi/h6FbNFjDJqk/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAo1uG8YthZ0zXOuwSO8WNyVdALYA",
      "Playlist": "37 videos",
      "subtitle": " The Essence of Vedanta: A Guide to Non-Dual Wisdom",
      "url": "https://youtube.com/playlist?list=PLDqahtm2vA70ccqIRFR_lipqKvxrHBRRw&feature=shared"
    },
    {
      "title": "नवविधाभक्ती मोरयाची",
      "thumbnail": "https://i.ytimg.com/vi/aIUeKF_CqUc/hqdefault.jpg?sqp=-oaymwExCNACELwBSFryq4qpAyMIARUAAIhCGAHwAQH4Af4JgALQBYoCDAgAEAEYISAdKH8wDw==&rs=AOn4CLBl9w8SflXNIWBEArxZtmE_XfWckg",
      "Playlist": "10 videos",
      "subtitle": "The Ninefold Devotion of Moraya",
      "url": "https://youtube.com/playlist?list=PL9ENM5NZhhGv2lKrSN4ikNp4usMF-UKE2&feature=shared"
    },
    {
      "title": "श्री गणेश नामार्थमाला",
      "thumbnail": "https://i.ytimg.com/vi/NiIYv2XzUOo/hqdefault.jpg?sqp=-oaymwExCNACELwBSFryq4qpAyMIARUAAIhCGAHwAQH4Af4JgALQBYoCDAgAEAEYICAaKH8wDw==&rs=AOn4CLAKiNwOqxn6D--XaJesw-ehpVj1Dw",
      "Playlist": "28 videos",
      "subtitle": "A Compilation of the Profound Meanings of Lord Ganesha's Names",
      "url": "https://youtube.com/playlist?list=PL9ENM5NZhhGuZx_b8gNjrlQEBBuIWFWdF&feature=shared"
    },
    {
      "title": "नीतिशतकम्",
      "thumbnail": "https://i.ytimg.com/vi/K2GDALMPtA0/hqdefault.jpg?sqp=-oaymwExCNACELwBSFryq4qpAyMIARUAAIhCGAHwAQH4AdQGgALgA4oCDAgAEAEYfyAbKB4wDw==&rs=AOn4CLDFZpDTR2f5z2qfrOJqhr1n6LRcfw",
      "Playlist": "140 videos",
      "subtitle": "A Hundred Verses of Wisdom and Ethics",
      "url": "https://youtube.com/playlist?list=PL9ENM5NZhhGt1hTWsN_LESzLUS-xbjU5K&feature=shared"
    },
    {
      "title": "Yoga & Mind Sciences",
      "thumbnail": "https://i.ytimg.com/vi/M-EmX-O1dTI/hqdefault.jpg?sqp=-oaymwEXCNACELwBSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCJpCp93daUcq_eN6JWFRaQYPbA0Q",
      "Playlist": "31 videos",
      "subtitle": "Exploring the Union of Body, Mind, and Consciousness",
      "url": "https://youtube.com/playlist?list=PLGQElwzyJxty56xPtGAArwQTiCaRgjobM&feature=shared"
    },
    {
      "title": "For Extra Playlist",
      "thumbnail": "https://via.placeholder.com/150",
      "duration": "5:00",
      "subtitle": "Start your fitness journey today!",
      "url": "https://www.youtube.com/watch?v=7wtfhZwyrcc"
    },
  ];

  VideoPage({super.key});

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

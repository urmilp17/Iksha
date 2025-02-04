import 'package:flutter/material.dart';
import 'package:iksha/colours.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:provider/provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../internet_service.dart';

class Playlist extends StatelessWidget {
  final String url;

  Playlist({super.key, required this.url});

  Future<List<Map<String, String>>> fetchPlaylistVideos(
      String playlistUrl) async {
    try {
      var yt = YoutubeExplode();
      var playlist = await yt.playlists.get(playlistUrl);
      var videos = await yt.playlists.getVideos(playlist.id).toList();

      var videoInfo = await Future.wait(videos.map((video) async {
        var videoDetails = await yt.videos.get(video.id);
        var thumbnailUrl =
            videoDetails.thumbnails.standardResUrl;
        return {
          'url': videoDetails.url,
          'title': videoDetails.title,
          'thumbnailUrl': thumbnailUrl,
        };
      }));

      yt.close();
      return videoInfo;
    } catch (e) {
      print('An error occurred: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final isConnectedToInternet =
        Provider.of<InternetConnectionService>(context).isConnectedToInternet;

    return isConnectedToInternet
        ? Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: fetchPlaylistVideos(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No videos found.'));
          } else {
            final videoList = snapshot.data!;
            return Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 200,
                  decoration: BoxDecoration(
                    color: background
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: videoList.length,
                    itemBuilder: (context, index) {
                      final video = videoList[index];
                      return ListTile(
                          leading: Image.network(
                          video['thumbnailUrl']!,
                          width: 100,
                          height: 60,
                          fit: BoxFit.cover,)
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    )
        : Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off, // No connection icon
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              localizations?.no_internet ?? 'No Wifi or Cellular Data',
              style: const TextStyle(
                fontFamily: 'Eczar',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              localizations?.playlist ??
                  'Unable to load playlist.\nPlease check your connection and try again.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Eczar',
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final settings = OpenSettingsPlus.shared;
                    if (settings is OpenSettingsPlusAndroid) {
                      settings.wifi();
                    } else if (settings is OpenSettingsPlusIOS) {
                      settings.wifi();
                    } else {
                      throw Exception('Platform not supported');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    localizations?.settings ?? 'Settings',
                    style: const TextStyle(fontFamily: 'Eczar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector videotile(BuildContext context,Map<String, String> video) {
  return GestureDetector(
    onTap: () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => Playlist(url: video["url"]!)),
            (route) => false,
      );
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  video["thumbnailUrl"]!,
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
                        fontFamily: "Eczar",
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
                        fontFamily: "Eczar",
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    ),
  );
}
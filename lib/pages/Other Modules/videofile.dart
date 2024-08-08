import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlaylistPage extends StatefulWidget {
  @override
  _VideoPlaylistPageState createState() => _VideoPlaylistPageState();
}

class _VideoPlaylistPageState extends State<VideoPlaylistPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  int _currentIndex = 0;

  final List<String> _videoUrls = [
    'https://www.example.com/video1.mp4',
    'https://www.example.com/video2.mp4',
    'https://www.example.com/video3.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _initializePlayer(_videoUrls[_currentIndex]);
  }

  void _initializePlayer(String url) {
    _videoPlayerController = VideoPlayerController.network(url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
    );

    _videoPlayerController!.addListener(() {
      if (_videoPlayerController!.value.isInitialized) {
        setState(() {});
      }
    });
    _videoPlayerController!.initialize();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _playVideo(int index) {
    setState(() {
      _currentIndex = index;
      _initializePlayer(_videoUrls[_currentIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Playlist'),
      ),
      body: Column(
        children: [
          // Video Player Section
          if (_chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized)
            AspectRatio(
              aspectRatio: _chewieController!.videoPlayerController.value.aspectRatio,
              child: Chewie(
                controller: _chewieController!,
              ),
            )
          else
            Center(
              child: CircularProgressIndicator(),
            ),
          const SizedBox(height: 20),
          // Video Playlist Section
          Expanded(
            child: ListView.builder(
              itemCount: _videoUrls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Video ${index + 1}'),
                  onTap: () {
                    _playVideo(index);
                  },
                  selected: index == _currentIndex,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

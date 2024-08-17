import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTestPagew extends StatefulWidget {
  const VideoTestPagew({super.key});

  @override
  State<VideoTestPagew> createState() => _VideoTestPageState();
}

class _VideoTestPageState extends State<VideoTestPagew> {
  VideoPlayerController videoPlayerController =
      VideoPlayerController.networkUrl(Uri.parse(
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"));
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    initVideoController();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      allowFullScreen: true,
      autoPlay: true,
      looping: true,
      showOptions: false,
    );
  }

  initVideoController() async {
    await videoPlayerController.initialize().then((e) {
      videoPlayerController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Video Test Page",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
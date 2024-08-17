import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Instagrampage extends StatefulWidget {
  const Instagrampage({super.key});

  @override
  State<Instagrampage> createState() => _InstagrampageState();
}

class _InstagrampageState extends State<Instagrampage> {
  List _ids = ["YMx8Bbev6T4", "rXl6q0LwYDc", "Qn7nNw2bCqQ", "6rW1X2oZ0yY"];
  late List<YoutubePlayerController> controllers;

  @override
  void initState() {
    controllers = List.generate(_ids.length,
     (index) => YoutubePlayerController(
       initialVideoId: _ids[index],
       flags: const YoutubePlayerFlags(
         autoPlay: true,
         mute: false,
         loop: true,
       ),
     )
     );
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _ids.length,
      itemBuilder: (_, __) {
        return YoutubePlayer(
          controller: controllers[__],
        );
      },
    );
  }
}

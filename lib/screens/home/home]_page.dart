import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Instagrampage1 extends StatefulWidget {
  const Instagrampage1({super.key});

  @override
  State<Instagrampage1> createState() => _InstagrampageState();
}

class _InstagrampageState extends State<Instagrampage1> {
  List<String> _ids = ["YMx8Bbev6T4", "rXl6q0LwYDc", "Qn7nNw2bCqQ", "6rW1X2oZ0yY"];
  late List<YoutubePlayerController> controllers;

  @override
  void initState() {
    controllers = List.generate(_ids.length, (index) => YoutubePlayerController(
      initialVideoId: _ids[index],
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
      ),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagramga o\'xshash sahifa'),
      ),
      body: buildReorderableListView(),
    );
  }

  Widget buildReorderableListView() {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final String item = _ids.removeAt(oldIndex);
          _ids.insert(newIndex, item);
          // Yangi tartibga mos keladigan videokontrolchilarni qayta initsializatsiya qiling
          controllers = List.generate(_ids.length, (index) => YoutubePlayerController(
            initialVideoId: _ids[index],
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
              loop: true,
            ),
          ));
        });
      },
      children: List.generate(_ids.length, (index) {
        return ListTile(
          key: Key(_ids[index]),
          title: YoutubePlayer(
            controller: controllers[index],
          ),
        );
      }),
    );
  }
}
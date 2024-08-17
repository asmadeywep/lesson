import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeWorkPage extends StatefulWidget {
  const HomeWorkPage({super.key});

  @override
  State<HomeWorkPage> createState() => _HomeWorkPageState();
}

class _HomeWorkPageState extends State<HomeWorkPage> {
  TextEditingController textEditingController =TextEditingController();
  late YoutubePlayerController _youtubePlayerController;
  @override
  void initState() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: "TLuaTrYh7Pk",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,

        loop: true,
      )
    );
    _youtubePlayerController.setVolume(50);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: _youtubePlayerController,
        ),
      ),
      floatingActionButton: TextField(
        controller: textEditingController,
        decoration: InputDecoration(hintText: "Type new youtube id"),
        onEditingComplete: (){
          if (textEditingController.text.isNotEmpty){
            _youtubePlayerController.load(textEditingController.text);
            textEditingController.clear();
            setState(() {});
          }
        }
      ),
    );
  }
}
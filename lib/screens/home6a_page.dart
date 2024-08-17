// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoTestPage extends StatefulWidget {
//   const VideoTestPage({super.key});

//   @override
//   State<VideoTestPage> createState() => VideoTestPageState();
// }

// class VideoTestPageState extends State<VideoTestPage> {
//   VideoPlayerController videoPlayerController =
//       VideoPlayerController.asset('assets/fish.mp4');
//   late ChewieController chewieController;
//   late YoutubePlayerController youtubePlayerController;
//   late PlayerState _playerState;
//   late YoutubeMetaData _videoMetaData;
//   bool _isPlayerReady = false;
//   final TextEditingController _controller = TextEditingController();
//   String? _videoId;

//   @override
//   void initState() {
//     super.initState();
//     chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       autoPlay: true,
//       looping: false,
//       showControls: false,
//     );
//     _videoMetaData = const YoutubeMetaData();
//     _playerState = PlayerState.unknown;

//     _controller.addListener(() {
//       if (_isPlayerReady && mounted && youtubePlayerController.value.isFullScreen) {
//         setState(() {
//           _playerState = youtubePlayerController.value.playerState;
//           _videoMetaData = youtubePlayerController.metadata;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     chewieController.dispose();
//     youtubePlayerController.dispose();
//     super.dispose();
//   }

//   void _loadYouTubeVideo(String videoId) {
//     setState(() {
//       _videoId = videoId;
//       youtubePlayerController = YoutubePlayerController(
//         initialVideoId: videoId,
//         flags: YoutubePlayerFlags(
//           autoPlay: true,
//           mute: false,
//         ),
//       )..addListener(() {
//           if (mounted) {
//             setState(() {
//               _isPlayerReady = true;
//             });
//           }
//         });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Video Player Test',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: 'Enter YouTube Video ID',
//                 border: OutlineInputBorder(),
//               ),
//               onFieldSubmitted: (value) {
//                 _loadYouTubeVideo(value);
//               },
//             ),
//             SizedBox(height: 16),
//             _videoId != null
//                 ? Container(
//                     height: 200,
//                     child: YoutubePlayer(
//                       controller: youtubePlayerController,
//                       showVideoProgressIndicator: true,
//                       onReady: () {
//                         _isPlayerReady = true;
//                       },
//                     ),
//                   )
//                 : Container(
//                     height: 200,
//                     child: Chewie(
//                       controller: chewieController,
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: VideoTestPage(),
//   ));
// }

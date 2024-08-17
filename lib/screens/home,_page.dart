import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MywwApp());
}

class MywwApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Video Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoPlayerPage(),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  final _controller = TextEditingController();
  String _videoId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Video Player'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'YouTube video identifikatori',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _videoId = _controller.text;
                });
              },
              child: Text('Yuborish'),
            ),
            SizedBox(height: 20),
            _videoId.isEmpty
                ? Text('Iltimos, YouTube video identifikatorini kiriting')
                : Expanded(
                    child: WebView(
                      initialUrl: 'https://www.youtube.com/watch?v=$_videoId',
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
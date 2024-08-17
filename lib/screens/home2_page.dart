import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
 State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets Test"),
      ),
      body: GridView.builder(
        itemCount: 15,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder:(context, index){
          return Container(
            height: 200,
            width: 200,
            child: FadeInImage(
              placeholder: AssetImage("assets/Loading_2.gif"),
              image: NetworkImage("https://img-cdn.pixelr.com/image-generator/https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg?auto=compress&h=300&w=300"),
              fit: BoxFit.cover,
            ),
          );
        }
      )
    );
  }
}
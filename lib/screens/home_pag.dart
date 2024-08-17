import 'package:asd_project/screens/home2_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets Test"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index){
          return ListTile(
            onTap: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => SecondPage()));
            },
            title: Text("Foydalanovchi $index"),
            subtitle: Text("Bu foydalanuvchi bizning mijozimiz"),
            trailing: Icon(Icons.people),
          );
        }
        ),
    );
  }
  }
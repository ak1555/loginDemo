import 'package:flutter/material.dart';

class Hero1 extends StatefulWidget {
  const Hero1({super.key});

  @override
  State<Hero1> createState() => _Hero1State();
}

class _Hero1State extends State<Hero1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero1"),
      ),
        body: Center(
        child: GestureDetector(
          onTap:() {
            
          },
          child: Hero(tag: 'hero-image',
            child: Image.network("https://mir-s3-cdn-cf.behance.net/projects/404/01b83f91744527.5e39c30185098.png",
            height: 100,
            width: 100,),
          ),
        ),
      ),
    );
  }
}
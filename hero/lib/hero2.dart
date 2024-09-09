import 'package:flutter/material.dart';

class Hero2 extends StatefulWidget {
  const Hero2({super.key});

  @override
  State<Hero2> createState() => _Hero2State();
}

class _Hero2State extends State<Hero2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero2"),
      ),

      body: Center(
        child: GestureDetector(
          
          child: Hero(tag: 'image-hero', 
          child: Image.network("https://mir-s3-cdn-cf.behance.net/projects/404/01b83f91744527.5e39c30185098.png",
            height: 300,
            width: 300,),)
        ),
      ),
    );
  }
}
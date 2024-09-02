import 'package:flutter/material.dart';

class AnimatedWork1 extends StatefulWidget {
  const AnimatedWork1({super.key});

  @override
  State<AnimatedWork1> createState() => _AnimatedWork1State();
}

class _AnimatedWork1State extends State<AnimatedWork1> {
  bool _isposition=false;
  double height = 0;
  double width= double.infinity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
      duration: Duration(milliseconds: 0),
    color: const Color.fromARGB(255, 163, 162, 162),
    height: height,
    width: width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(height: 75,
        width: 75,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 5, 184, 207),borderRadius: BorderRadius.circular(100)),
        child:_isposition? Icon(Icons.wifi):Text(""),
        ),
          Container(height: 75,
        width: 75,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 5, 184, 207),borderRadius: BorderRadius.circular(100)),
        child:_isposition? Icon(Icons.bluetooth):Text(""),
        ),
         Container(height: 75,
        width: 75,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 5, 184, 207),borderRadius: BorderRadius.circular(100)),
        child:_isposition? Icon(Icons.mobiledata_off):Text(""),
        ),
         Container(height: 75,
        width: 75,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 5, 184, 207),borderRadius: BorderRadius.circular(100)),
        child:_isposition? Icon(Icons.screen_lock_portrait):Text(""),
        ),
      ]
    ),
    ),

    floatingActionButton: FloatingActionButton(onPressed: () {
      setState(() {
       _isposition? height=0:height=100;
       _isposition=!_isposition;
      });
    },child: Icon(Icons.touch_app_outlined),),
    );
  }
}
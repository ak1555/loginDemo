import 'package:flutter/material.dart';

class AnimatedAlignmentExmp extends StatefulWidget {
  const AnimatedAlignmentExmp({super.key});

  @override
  State<AnimatedAlignmentExmp> createState() => _AnimatedAlignmentExmpState();
}

class _AnimatedAlignmentExmpState extends State<AnimatedAlignmentExmp> {
  Alignment centre= Alignment.topCenter;
  bool _isalignment=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedAlign(
        alignment: _isalignment?Alignment.topCenter:Alignment.bottomCenter,
         duration: Duration(milliseconds: 2000),
         child: Container(
          height: 100,
          width: 100,
          color: Colors.blueAccent,
         ),
      )  ,

      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _isalignment=!_isalignment;
        });
      },child: Icon(Icons.touch_app_outlined),),
    ) ;
  }
}
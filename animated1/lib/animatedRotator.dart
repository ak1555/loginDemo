import 'package:flutter/material.dart';

class AnimatedRotationExmap extends StatefulWidget {
  const AnimatedRotationExmap({super.key});

  @override
  State<AnimatedRotationExmap> createState() => _AnimatedRotationExmapState();
}

class _AnimatedRotationExmapState extends State<AnimatedRotationExmap> {
  bool _isrotation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedRotation(turns:_isrotation?1:0 , duration: Duration(seconds: 5),
      child: Center(
        child: Container(height: 100,width: 100,
        color: Colors.cyan,),
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
       setState(() {
          _isrotation=!_isrotation;
       });
      },child: Icon(Icons.touch_app_outlined),),
    );
  }
}
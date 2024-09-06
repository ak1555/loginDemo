import 'package:flutter/material.dart';

class AnimatedOpacityExmp extends StatefulWidget {
  const AnimatedOpacityExmp({super.key});

  @override
  State<AnimatedOpacityExmp> createState() => _AnimatedOpacityExmpState();
}

class _AnimatedOpacityExmpState extends State<AnimatedOpacityExmp> {
  bool isopacity=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(opacity:isopacity?1:0 , duration: Duration(milliseconds: 2000),
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.green,
        ),
      ),),

      floatingActionButton: FloatingActionButton(onPressed: () {
        
       setState(() {
          isopacity=!isopacity;
       });

      },child: Icon(Icons.touch_app_outlined),),
    );
  }
}
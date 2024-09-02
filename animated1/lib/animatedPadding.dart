import 'package:flutter/material.dart';

class AnimatedPaddingExmp extends StatefulWidget {
  const AnimatedPaddingExmp({super.key});

  @override
  State<AnimatedPaddingExmp> createState() => _AnimatedAlignmentExmpState();
}

class _AnimatedAlignmentExmpState extends State<AnimatedPaddingExmp> {
  Alignment centre= Alignment.topCenter;
  bool _ispading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedPadding(padding:_ispading?EdgeInsets.all(50):EdgeInsets.all(10) ,
       duration: Duration(milliseconds: 2000),
       child: Container(
        height: 100,
        width: 100,
        color: Colors.cyan,
       ),
       ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
         _ispading=!_ispading;
        });
      },child: Icon(Icons.touch_app_outlined),),
    ) ;
  }
}
import 'package:flutter/material.dart';

class AnimatedCrossFadeExmp extends StatefulWidget {
  const AnimatedCrossFadeExmp({super.key});

  @override
  State<AnimatedCrossFadeExmp> createState() => _AnimatedCrossFadeExmpState();
}

class _AnimatedCrossFadeExmpState extends State<AnimatedCrossFadeExmp> {
  bool _isshow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedCrossFade(firstChild: IconButton(onPressed: () {
       setState(() {
          _isshow=false;
       });
      }, icon: Icon(Icons.play_arrow)), 
      secondChild: IconButton(onPressed: () {
      setState(() {
          _isshow=true;
      });
      }, icon: Icon(Icons.pause)), 
      crossFadeState:_isshow? CrossFadeState.showFirst:CrossFadeState.showSecond, 
      duration: Duration(microseconds: 500000)),
    );
  }
}
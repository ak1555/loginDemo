// import 'dart:ffi';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';

class AnimatedContainerExmp extends StatefulWidget {
  const AnimatedContainerExmp({super.key});

  @override
  State<AnimatedContainerExmp> createState() => _AnimatedContainerExmpState();
}

class _AnimatedContainerExmpState extends State<AnimatedContainerExmp> {
double height=10;
    double width=double.infinity;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 2000),
      width:width,
      height: height,
      color: Colors.red,
    
      ),

      floatingActionButton:FloatingActionButton(
        onPressed: () {
        setState(() {
          height=600;
        });
      }, child: Icon(Icons.swipe_down)),
    );
  }
}
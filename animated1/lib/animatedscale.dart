import 'package:flutter/material.dart';

class AnimatedScaleExmp extends StatefulWidget {
  const AnimatedScaleExmp({super.key});

  @override
  State<AnimatedScaleExmp> createState() => _AnimatedScaleExmpState();
}

class _AnimatedScaleExmpState extends State<AnimatedScaleExmp> {
  bool _isscale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedScale(scale: _isscale?1:2, duration: Duration(seconds: 1),
      child: Center(
        child: Container(
          color: Colors.purple,
          height: 100,
          width: 100,
        ),
      ),),

      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _isscale=!_isscale;
        });
      },child: Icon(Icons.touch_app_outlined),),
    );
  }
}
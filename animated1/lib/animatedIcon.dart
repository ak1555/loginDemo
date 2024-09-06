import 'package:flutter/material.dart';

class AnimatedIconExmp extends StatefulWidget {
  const AnimatedIconExmp({super.key});

  @override
  State<AnimatedIconExmp> createState() => _AnimatedIconExmpState();
}

class _AnimatedIconExmpState extends State<AnimatedIconExmp>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isicon=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedIcon(icon: _isicon?AnimatedIcons.menu_arrow:AnimatedIcons.close_menu,
         progress: _controller),
      ),

       floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _isicon=!_isicon;
          _controller.forward(from: 0);
        });
         
       },child: Icon(Icons.touch_app_outlined),),
    );
  }
}
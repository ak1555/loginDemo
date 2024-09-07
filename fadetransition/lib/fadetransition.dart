import 'package:flutter/material.dart';

class FadeTransitionExmp extends StatefulWidget {
  const FadeTransitionExmp({super.key});

  @override
  State<FadeTransitionExmp> createState() => _FadeTransitionExmpState();
}

class _FadeTransitionExmpState extends State<FadeTransitionExmp>with SingleTickerProviderStateMixin {
  late AnimationController _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 500));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(opacity: _controller,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.indigoAccent,
      ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        if(_controller.isDismissed){
          _controller.forward();
        }else{
          _controller.reverse();
        }
      },child: Icon(Icons.touch_app_outlined),),
    );
  }
}
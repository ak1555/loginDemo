import 'package:flutter/material.dart';

class RoatationTransitionExmp extends StatefulWidget {
  const RoatationTransitionExmp({super.key});

  @override
  State<RoatationTransitionExmp> createState() => _RoatationTransitionExmpState();
}

class _RoatationTransitionExmpState extends State<RoatationTransitionExmp>
 with SingleTickerProviderStateMixin{
 late AnimationController _controller
 =AnimationController(vsync: this,duration: Duration(seconds: 5));
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(turns: _controller,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ) ,
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
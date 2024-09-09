import 'package:flutter/material.dart';

class SlideTransitionExmp extends StatefulWidget {
  const SlideTransitionExmp({super.key});

  @override
  State<SlideTransitionExmp> createState() => _SlideTransitionExmpState();
}

class _SlideTransitionExmpState extends State<SlideTransitionExmp> with SingleTickerProviderStateMixin{
  late AnimationController _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
 late Animation<Offset> _slidetransition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _slidetransition=Tween<Offset>(begin: Offset(0, -1),end: Offset.zero).animate(_controller);
    _controller.forward();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideTransition(position: _slidetransition,
      child: Center(child: Text("Synnefo Solutions"),),),

      
    );
  }
}
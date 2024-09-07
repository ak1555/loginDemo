import 'package:flutter/material.dart';

class ScaletransitionExmp extends StatefulWidget {
  const ScaletransitionExmp({super.key});

  @override
  State<ScaletransitionExmp> createState() => _ScaletransitionExmpState();
}

class _ScaletransitionExmpState extends State<ScaletransitionExmp>
 with SingleTickerProviderStateMixin{
 
 
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
      body:ScaleTransition(
        scale: _controller,
      child:  Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.tealAccent,
      ),),
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
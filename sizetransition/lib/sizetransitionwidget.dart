import 'package:flutter/material.dart';

class SizeTransitionWidgetExp extends StatefulWidget {
  const SizeTransitionWidgetExp({super.key});

  @override
  State<SizeTransitionWidgetExp> createState() => _SizeTransitionWidgetExpState();
}

class _SizeTransitionWidgetExpState extends State<SizeTransitionWidgetExp>with SingleTickerProviderStateMixin {
  late AnimationController _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 350));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizeTransition(sizeFactor: _controller,
      axis: Axis.vertical,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.cyan,
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
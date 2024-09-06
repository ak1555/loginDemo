import 'package:flutter/material.dart';

class ADefaultTextField extends StatefulWidget {
  const ADefaultTextField({super.key});

  @override
  State<ADefaultTextField> createState() => _ADefaultTextFieldState();
}

class _ADefaultTextFieldState extends State<ADefaultTextField> {
  bool _istext = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedDefaultTextStyle(child: Text("Hello World!!!"),
       style: TextStyle(
          fontSize: _istext?50:10,
          color: _istext?Colors.green:Colors.red,
          fontWeight: _istext?FontWeight.w900:FontWeight.w700
       ),
        duration: Duration(milliseconds: 200)),

        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            _istext=!_istext;
          });
        },),
    );
  }
}
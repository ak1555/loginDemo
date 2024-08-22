import 'package:flutter/material.dart';
// import 'dart:convert';
class demo2 extends StatefulWidget {
  const demo2({super.key});

  @override
  State<demo2> createState() => _demo2State();
}

class _demo2State extends State<demo2> {
  
  @override
  Widget build(BuildContext context) {
    //  String msg= ModalRoute.of(context)?.settings.arguments as String;
    String ms= ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: Container(height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Container(child: Column(
        children: [
          // Text(ms),
        ElevatedButton(style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                 Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false,);
            },
            child: Text(" signup button ")
            )
            
            ,],
            ),)));
    
  }
}
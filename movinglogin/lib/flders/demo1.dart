import 'package:flutter/material.dart';
import 'package:movinglogin/flders/demo2.dart';
// import 'dart:convert';

class demo1 extends StatefulWidget {
  const demo1({super.key});

  @override
  State<demo1> createState() => _demo1State();
}

class _demo1State extends State<demo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: 
        Column(
          children: [Text("page1"),
            ElevatedButton(style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                    //  Navigator.pushNamed(context, '/demo2');
                     Navigator.push(context, MaterialPageRoute(builder: (context) => demo2(),));
                     Navigator.pushReplacementNamed(context, '/demo2',arguments: "hellooooo");
                },
                child: Text(" signup button ")),
          ],
        ),),
    );
  }
}
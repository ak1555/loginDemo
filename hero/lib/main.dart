import 'package:flutter/material.dart';
import 'package:hero/hero1.dart';
import 'package:hero/hero2.dart';

void main() {
  runApp(MaterialApp(

    initialRoute: "hero1",
    routes: {
      "hero1":(context)=>Hero1(),
      "hero2":(context)=>Hero2()
    },
  ));
}

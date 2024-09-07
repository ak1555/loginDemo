import 'package:bloodbank/addfile.dart';
import 'package:bloodbank/details.dart';
import 'package:bloodbank/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      // initialRoute: "/addfile",
      initialRoute: "/homepage",
      routes: {
        "/details":(context)=>Details(),
        "/addfile":(context)=>AddFile(),
        "/homepage":(context)=>HomePage(),
      },
    )
  );
}
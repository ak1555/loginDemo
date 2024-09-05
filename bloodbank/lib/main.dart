import 'package:bloodbank/addfile.dart';
import 'package:bloodbank/details.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      initialRoute: "/addfile",
      routes: {
        "/details":(context)=>Details(),
        "/addfile":(context)=>AddFile(),
      },
    )
  );
}
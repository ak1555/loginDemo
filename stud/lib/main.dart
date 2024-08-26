import 'package:flutter/material.dart';
import 'package:stud/addfile.dart';
import 'package:stud/details.dart';
import 'package:stud/editfile.dart';
import 'package:stud/mainpage.dart';
void main(){
  runApp(MaterialApp(
    home: Mainpage(),
    // home: Details(),
    // initialRoute: "/mainpage",
    routes: {
      "/mainpage":(context)=>Mainpage(),
      "/details":(context)=>Details(),
      "/edit":(context)=>EditPaeg(),
      "/addfile":(context)=>AddFile()
    },
  ));
}
import 'package:cntctbook/addfile.dart';
import 'package:cntctbook/contacts.dart';
import 'package:cntctbook/detail.dart';
import 'package:cntctbook/editfile.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    // home: Mainpage(),
    // home: Details(),
    // initialRoute: "/detail",
     initialRoute: "/contacts",
    routes: {

      "/addfile":(context)=>AddFile(),
      "/contacts":(context)=>Contacts(),
      "/detail":(context)=>Detail(),
      "/editfile":(context)=>EditFile()
    },
  ));
}
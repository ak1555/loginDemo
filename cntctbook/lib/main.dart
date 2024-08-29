import 'package:cntctbook/addfile.dart';
import 'package:cntctbook/contacts.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    // home: Mainpage(),
    // home: Details(),
    initialRoute: "/contacts",
    routes: {

      "/addfile":(context)=>AddFile(),
      "/contacts":(context)=>Contacts()
    },
  ));
}
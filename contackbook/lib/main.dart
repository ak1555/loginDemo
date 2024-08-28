import 'package:contackbook/addcontact.dart';
import 'package:contackbook/contacts.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(
    MaterialApp(
      initialRoute: "addcontact",
      routes: {
        "/":(contex)=>Contacts(),
        "addcontact":(context)=>AddContact(),
      },
    )
  );
}
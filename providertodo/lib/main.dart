import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertodo/addpage1.dart';
import 'package:providertodo/editpage.dart';
import 'package:providertodo/providertodos/providertodos.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => TodoS(),
    child: MaterialApp(
      home: AddPage1(),
      routes: {
        "/edit":(context)=>EditPage()
      },
    ),)
  );
}
import 'package:expense_tracker/homepage.dart';
import 'package:expense_tracker/statement.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var mybox=await Hive.openBox('mybox');
  runApp(
     MaterialApp(
     home:  HomePage(),
     routes: {
      "/statement":(context)=>StateMent()
     },    )
  );
}
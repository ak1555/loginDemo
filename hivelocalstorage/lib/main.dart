import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivelocalstorage/hivelocalstore.dart';

void main() async{

  // initialize hive
  await Hive.initFlutter();

  // open Hive box
  var box=await Hive.openBox('mybox');
  runApp(
    MaterialApp(
      home: HiveStore(),
    )
  );
}

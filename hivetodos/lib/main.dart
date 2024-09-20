import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivetodos/hivetodo.dart';

void main() async{
      await Hive.initFlutter();
    var box = await Hive.openBox('mybox');
  runApp(
    MaterialApp(
      home: HiveTodos(),
    )
  );
}

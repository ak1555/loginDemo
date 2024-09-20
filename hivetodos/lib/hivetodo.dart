import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveTodos extends StatefulWidget {
  const HiveTodos({super.key});

  @override
  State<HiveTodos> createState() => _HiveTodosState();
}

class _HiveTodosState extends State<HiveTodos> {
      TextEditingController c1 = TextEditingController();
    final mybox= Hive.box('mybox');

      void add(){
        List<Map<dynamic,dynamic>> ls=[];
        var data=c1.text;
        // var d=jsonEncode(data);
        ls.add({"name":data});
        print(data.);
        mybox.put(1, ls);
        // print(mybox.get(1));
      }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("ADD LIST"),),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 50,right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text("NAME"),
                SizedBox(width: 20,),
                Expanded(child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ))
              ],
            ),


SizedBox(height: 250,),

            MaterialButton(onPressed: () {
              add();
            },child: Text("SUBMIT"),)
          ],
        ),
      ),
    );
  }
}
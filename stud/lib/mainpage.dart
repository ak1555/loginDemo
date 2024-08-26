import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stud/addfile.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  bool cas = false;
  List<dynamic>ls =[];

void add(){}

  void ad() async{
 final prefs= await SharedPreferences.getInstance();
 final res=prefs.getString("Todos");
  ls=json.decode(res!);
  if(ls==" "){
cas=false;
  }
  else{
    cas=true;
  }
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShowCase"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        color: Colors.grey,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Text("data")),
              Expanded(
                flex: 0,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(height: 50,width: 50,
                  // color: Colors.amber,
                  alignment: Alignment.center,
                  child: IconButton(
                    style: IconButton.styleFrom(backgroundColor: Colors.green,iconSize: 35,
                    foregroundColor: Colors.white),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddFile(),));
                  }, icon: Icon(Icons.add)),
                  )
                ],
              ))
          ],
        ),
      ),
    );
  }
}
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

  List<dynamic>ls =[];
  
  
  void show() async{
 final prefs= await SharedPreferences.getInstance();
 final res=prefs.getString("Todos");
  ls=json.decode(res!);
  print(ls);
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
            TextButton(onPressed: () {
              show();
            }, child: Text("REFREASH.")),
            Expanded(
              flex: 5,
              child: 
              ListView.builder(
                itemCount: ls.length,
                itemBuilder: (context, index) {
                return 
                ListTile(
                  leading: Text(index.toString()),
                  title: Text(ls[index]),
                );
              },)
              ),
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
                      Navigator.pushNamed(context, "/addfile");
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
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
List ls=[];
void cncts() async{
  final prefs=await SharedPreferences.getInstance();
  final res=prefs.getString("ContactBook");
  // print(res);

  setState((){
    ls=jsonDecode(res!);
  });
print(ls);

}

 void initState(){
    super.initState();
    cncts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CONTACTS"),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // alignment: Alignment.center,
        padding: EdgeInsets.all(50),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Text("asd");
          },),
      ),
      floatingActionButton: IconButton( 
        padding: EdgeInsets.all(15),
        style: IconButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 12, 121, 245),
          foregroundColor: Colors.white
        ),
        onPressed: () {
        Navigator.pushNamed(context, "/addfile");
        // cncts();
      }, icon: Icon(Icons.add,size: 40,)),
    );
  }
}
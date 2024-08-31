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
  final res=prefs.getString("contactbook");
  // print(res);
  print(res);
  print("hii");

 try{
  setState(() {
    ls=jsonDecode(res!);
  });
        
 }catch(e){
  print(e);
  print("empty res");
 }
  

print(ls);
}

@override
  void initState() {
    // TODO: implement initState
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
        padding: EdgeInsets.only(left: 30,right: 30,top:40,bottom: 10 ),
        child: ListView.builder(
          itemCount: ls.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context,"/detail",arguments: index.toString() );
              },
              title: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row( 
                    // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ls[index]["fname"],style: TextStyle(fontSize: 19)),
                      Text(" "),Text(ls[index]["lname"],style: TextStyle(fontSize: 19))],),
                Text(ls[index]["phone"],style: TextStyle(fontSize: 14),)
                ],
              ),
              trailing: Icon(Icons.call,color: Colors.green,),
            );
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
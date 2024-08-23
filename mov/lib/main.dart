import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mov/s.dart';

void main(){
  runApp(MaterialApp(
    home: Passingdemo(),
     routes: {
      "fp":(context)=>SecndPage(),
      }
  ));
}


class Passingdemo extends StatefulWidget {
  const Passingdemo({super.key});

  @override
  State<Passingdemo> createState() => _PassingdemoState();
}

class _PassingdemoState extends State<Passingdemo> {
  @override
  Widget build(BuildContext context) {
    Map<dynamic , dynamic>mp={};
    TextEditingController c1 = TextEditingController();
    TextEditingController c2 = TextEditingController();
    TextEditingController c3 = TextEditingController();
    TextEditingController c4 = TextEditingController();
    TextEditingController c5 = TextEditingController();
    return Scaffold(
      body: Expanded(
        child: 
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(MediaQuery.of(context).size.height *.01),
        child: Column(
          children: [
            Container(height: 200,width: 100,
            child: Expanded(child:Image.asset('./images/picture1.jpg'), ),
            ),
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            Expanded(flex: 5,
              child: 
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height /3,
              width: MediaQuery.of(context).size.width ,
              margin: EdgeInsets.only(left:  MediaQuery.of(context).size.width *.12,right:  MediaQuery.of(context).size.width *.12) ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey),
                color: Colors.grey[50]
              ),
              alignment: Alignment.center,
              child: ListView(children: [
                 //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                 SizedBox(height: 5,),
               Container(height: 45,width: 250,alignment: Alignment.center,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(3),
                border: Border.all()),
               child: Row(children: [
                 Container( padding: EdgeInsets.only(left: 4),
                  child:  Icon(Icons.perm_identity)),
                SizedBox(width: 15,),
                 Expanded(child: TextField(
                  controller: c1,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    contentPadding: EdgeInsets.only(bottom: 14),
                border: InputBorder.none
                 ),))
               ],),),
               SizedBox(height: 15),
              //  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^2
               Container(height: 45,width: 250,alignment: Alignment.center,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(3),
                border: Border.all()),
               child: Row(children: [
                 Container( padding: EdgeInsets.only(left: 4),
                  child:  Icon(Icons.account_circle_outlined)),
                SizedBox(width: 15,),
                 Expanded(child: TextField(
                   controller: c2,
                   keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Age",
                    contentPadding: EdgeInsets.only(bottom: 14),
                border: InputBorder.none
                 ),))
               ],),),
               SizedBox(height: 15),
              //  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^3
              Container(height: 45,width: 250,alignment: Alignment.center,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(3),
                border: Border.all()),
               child: Row(children: [
                 Container( padding: EdgeInsets.only(left: 4),
                  child:  Icon(Icons.email_outlined)),
                SizedBox(width: 15,),
                 Expanded(child: TextField(
                   controller: c3,
                   keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "E-Mail",
                    contentPadding: EdgeInsets.only(bottom: 14),
                border: InputBorder.none
                 ),))
               ],),),
               SizedBox(height: 15),
              //  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^4
              Container(height: 45,width: 250,alignment: Alignment.center,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(3),
                border: Border.all()),
               child: Row(children: [
                 Container( padding: EdgeInsets.only(left: 4),
                  child:  Icon(Icons.phone)),
                SizedBox(width: 15,),
                 Expanded(child: TextField(
                   controller: c4,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    contentPadding: EdgeInsets.only(bottom: 14),
                border: InputBorder.none
                 ),))
               ],),),
               SizedBox(height: 15),
              //  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^5
              Container(height: 45,width: 250,alignment: Alignment.center,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(3),
                border: Border.all()),
               child: Row(children: [
                 Container( padding: EdgeInsets.only(left: 4),
                  child:  Icon(Icons.input_outlined)),
                SizedBox(width: 15,),
                 Expanded(child: TextField(
                   controller: c5,
                  decoration: InputDecoration(
                    hintText: "ID",
                    contentPadding: EdgeInsets.only(bottom: 14),
                border: InputBorder.none
                 ),))
               ],),),
               SizedBox(height: 15),
              //  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^6
              ],),
              
            ),),
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            Expanded(flex: 1,
              child: Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(onPressed: () {
                setState(() {
                   mp["name"]=c1;
                mp["name"]=c2;
                mp["name"]=c3;
                mp["name"]=c4;
                mp["name"]=c5;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecndPage(),));
               Navigator.pushReplacementNamed(context , "/sp",arguments: jsonEncode(mp) );
              }, child: Text("Submit")),
            ))
          ],
        ),
      ),),
    );
  }
}
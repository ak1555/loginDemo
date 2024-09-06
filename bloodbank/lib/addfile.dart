import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
TextEditingController c1= TextEditingController();
TextEditingController c2= TextEditingController();
TextEditingController c3= TextEditingController();
TextEditingController c4= TextEditingController();
TextEditingController c5= TextEditingController();
ImagePicker _picker=ImagePicker();
File? _image;

List sharedprefslist=[];
Map<dynamic,dynamic> mp={};


void pickimage() async{
final pickedfile=await _picker.pickImage(source: ImageSource.gallery);
setState(() {
  _image=File(pickedfile!.path);
});
}

Future< void >savedata()async{
  final prefs=await SharedPreferences.getInstance();
  final res=prefs.getString("bloodbank");

  final bytes=await _image!.readAsBytes();
  final base64img=base64Encode(bytes);
  if(res!=null){
    sharedprefslist=json.decode(res);
    
     try{
 mp={
        "name":c1.text,
        "email":c2.text,
        "phone":c3.text,
        "place":c4.text,
        "dob":c5.text,
        "image":base64img
      };
     }catch(e){
 mp={
        "name":c1.text,
        "email":c2.text,
        "phone":c3.text,
        "place":c4.text,
        "dob":c5.text,
        "image":null
      };
     }
      sharedprefslist.add(mp);
      prefs.setString("bloodbank", jsonEncode(sharedprefslist));
    
  }else{
     try{
 mp={
        "name":c1.text,
        "email":c2.text,
        "phone":c3.text,
        "place":c4.text,
        "dob":c5.text,
        "image":base64img
      };
     }catch(e){
 mp={
        "name":c1.text,
        "email":c2.text,
        "phone":c3.text,
        "place":c4.text,
        "dob":c5.text,
        "image":null
      };
     }
      sharedprefslist.add(mp);
      prefs.setString("bloodbank", jsonEncode(sharedprefslist));
    
  }
}



 String? seletedgroup;

final List<String>ls=[
  "O+",
  "O-",
  "A+",
  "A-",
  "B+",
  "B-",
  "AB+",
  "AB-",
  "A+",
  "A-",
  "B+",
  "B-",
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.cyan,
        child:ListView(
          children: [
            Container(
              height: 220,
              color: const Color.fromARGB(255, 172, 13, 13),
              width: double.infinity,
              child: Column(
                children: [
                  // =========================================stack start
                    Stack(
                    clipBehavior: Clip.none,
                    children: [
                             Container(
                    height: 110,
                    width: double.infinity,
                   decoration: BoxDecoration(
               
                    color: Colors.red,
                    borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.circular(100))
                   ),child: ClipRRect(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                    child: Image.asset("./images/redimg.jpeg",fit: BoxFit.fill,)),
                  ),

                      Positioned(top: 40,left: 110,
                        child:Container(height: 140,width: 140,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: const Color.fromARGB(255, 46, 44, 44)),)),
                      
                    ],
                  ),
                  // =========================================stack end

                 
                
                ],
              ),
            ),
            // ================================================ padding containers start
             Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Name"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(10),),
                    child: Expanded(child: Expanded(child: TextField(
                      controller: c1,
                       keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "FullName",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                  // ---------------------------------- fullname ^
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Email"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(10),),
                    child: Expanded(child: Expanded(child: TextField(
                      controller: c2,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                  // ---------------------------------- email ^
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Phone"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(10),),
                    child: Expanded(child: Expanded(child: TextField(
                      controller: c3,
                       keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "ContactNumber",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                   // ---------------------------------- contact number ^
                    Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Place"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(10),),
                    child: Expanded(child: Expanded(child: TextField(
                      controller: c4,
                       keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Place,District",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                   // ---------------------------------- place ^
                    Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Date of Birth"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(10),),
                    child: Expanded(child: Expanded(child: TextField(
                      controller: c5,
                       keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "dd-mm-yyyy",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                    // ---------------------------------- DOB ^
                      Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Blood Group"),
                  ),
                   Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(10),),
                    child:
 Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
   children: [
     Text(seletedgroup==null?'enter a blood group':'$seletedgroup'),
    //  SizedBox(width: 90,),
     DropdownButton(
      underline: Container(height: 0,),
      items: ls.map(
      (String bloodgrp){
        return DropdownMenuItem(
          value: bloodgrp,
          child: Text(bloodgrp),);
      }
     ).toList(),
     onChanged: (value) {
      setState(() {
        seletedgroup=value;
      });
     },),
    
   ],
 )
,
                  ),
                    // ---------------------------------- blood group ^
                    SizedBox(height: 25,),
                    Container(
                      child: Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                            backgroundColor: const Color.fromARGB(255, 172, 13, 13),
                            foregroundColor: Colors.white,
                            side: BorderSide(width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),elevation: 10,overlayColor: Colors.blue,

                            
                          ),
                          onPressed: () {
                          savedata();
                        }, child: Text("  SUBMIT  ")),
                      ),
                    ),
                    SizedBox(height: 25,),

                    // ================================================ padding containers end
          ],
        )
      ),
    );
  }
}
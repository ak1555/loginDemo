import 'dart:convert';
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
  TextEditingController c1=TextEditingController();
  TextEditingController c2=TextEditingController();
  TextEditingController c3=TextEditingController();
  TextEditingController c4=TextEditingController();
  bool image=false;
  File? _image;
final ImagePicker _picker = ImagePicker();

void pickimage() async{
  final PickedFile=await _picker.pickImage(source: ImageSource.gallery);
  if(PickedFile!=null){
  setState(() {
    _image=File(PickedFile!.path);
  });}
  image=true;
}

 Future<void> addd() async{
final prefs= await SharedPreferences.getInstance();
final res= prefs.getString("ContactBook");
final bytes=_image!.readAsBytes();
final base64img=base64Encode(bytes as List<int>);

try{
  List<dynamic> ls=json.decode(res!);
  Map<dynamic,dynamic>mp={
    "fname":c1.text,
    "lname":c2.text,
    "email":c3.text,
    "number":c4.text,
    // "photo":base64img+
  };
  ls.add(mp);
  prefs.setString("ContactBook", json.encode(ls));
  print(mp);
}
catch(error){
  List<Map<dynamic,dynamic>>lsmp=[{
    "fname":c1.text,
  "lname":c2.text,
  "email":c3.text,
  "number":c4.text,
  // "photo":base64img
  }];
  print(lsmp);
  prefs.setString("ContactBook", json.encode(lsmp));
}


c1.clear();
c2.clear();
c3.clear();
c4.clear();
  }


  // void initState(){
  //   super.initState();
  //   addd();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Contact",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),),
      ),
      body: ListView(
        children: [
        Container(
                height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.all(50),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        Container(height: 30,),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[200],
                ),
                child:image ? ClipOval(child: Image.file(_image!,fit: BoxFit.cover,),)
                :
                IconButton(onPressed: () {
                  pickimage();
                }, icon:  Icon(Icons.perm_identity_rounded,size: 110,)),
              ),
              // _________________
              SizedBox(height: 50,),
              Container(
                width: 350,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("FName",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                  SizedBox(height: 2),
                  Expanded(flex: 0, child: TextField(
                    controller: c1,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                    labelText: "FirstName",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                  ),)
                ],),
              ),
              // +++++++++++++++++++++++++++++++
              Container(
                width: 350,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Lname",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                  SizedBox(height: 2),
                  Expanded(flex: 0, child: TextField(
                     keyboardType: TextInputType.name,
                     controller:c2,
                     decoration: InputDecoration(
                    labelText: "LastName",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                  ),)
                ],),),
              Container(
                width: 350,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Email",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                  SizedBox(height: 2),
                  Expanded(flex: 0, child: TextField(
                     keyboardType: TextInputType.emailAddress,
                     controller:c3,
                    decoration: InputDecoration(
                    labelText: "Email ID",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                  ),)
                ],),),
              Container(
                width: 350,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Number",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                  SizedBox(height: 2),
                  Expanded(flex: 0, child: TextField(
                     keyboardType: TextInputType.number,
                     controller:c4,
                    decoration: InputDecoration(
                    labelText: "Contact Number",
                    border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                  ),)
                ],),),
    
                // SizedBox(height: 25,),   
            ],
           ),
        ),]
      ),
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 22, 20, 22)
        ),
        onPressed: () {
        addd();
      }, child:Text("Add Contact")),
    );
  }
}
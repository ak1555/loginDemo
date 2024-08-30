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
List <dynamic> ls=[];
    final ImagePicker _picker=ImagePicker();
    void pickimage() async{
      final pickedfile= await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image=File(pickedfile!.path);
         image=true;
      });
      image=true;
    }

    Future<void> saceData() async{
      final prefs=await SharedPreferences.getInstance();
      final res=prefs.getString("contactbook");

      final bytes=await _image!.readAsBytes();
      final base64img=base64Encode(bytes);
     
      if(res != null){
        ls=jsonDecode(res!);
        ls.add({
          "fname":c1.text,
          "lname":c2.text,
          "email":c3.text,
          "phone":c4.text,
          "photo":base64img,
        });
        prefs.setString("contactbook", jsonEncode(ls));
      }
      else{
        ls=[
          {
          "fname":c1.text,
          "lname":c2.text,
          "email":c3.text,
          "phone":c4.text,
          "photo":base64img,
        }
        ];
         prefs.setString("contactbook", jsonEncode(ls));
      }
    }


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
        saceData();
      }, child:Text("Add Contact")),
    );
  }
}
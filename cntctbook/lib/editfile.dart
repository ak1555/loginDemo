import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
class EditFile extends StatefulWidget {
  const EditFile({super.key});
  @override
  State<EditFile> createState() => _EditFileState();
}
class _EditFileState extends State<EditFile> {

  TextEditingController c1=TextEditingController();
  TextEditingController c2=TextEditingController();
  TextEditingController c3=TextEditingController();
  TextEditingController c4=TextEditingController();

  File? _image;
  bool img=false;
  Uint8List? _inputimage;
  int? indexnumber;
List <dynamic> ls=[];
    final ImagePicker _picker=ImagePicker();

    void pickimage() async{
      final pickedfile= await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image=File(pickedfile!.path);
        img=true;
      });
      // image=true;
    }

// 
    Future<void> saceData() async{
      final prefs=await SharedPreferences.getInstance();
      final res=prefs.getString("contactbook");
print(res);
      // final bytes=await _image!.readAsBytes();
      // final base64img=base64Encode(bytes);
     
      if(res != null){
        ls=jsonDecode(res!);
      
      setState(() {
        c1.text=ls[indexnumber!]["fname"];
        c2.text=ls[indexnumber!]["lname"];
        c3.text=ls[indexnumber!]["email"];
        c4.text=ls[indexnumber!]["phone"];

          //  _inputimage=base64Decode(ls[indexnumber!]["photo"]);
      });    
      }
      
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saceData();
  }


  Future<void> AddData() async{
      final prefs=await SharedPreferences.getInstance();
      final res=prefs.getString("contactbook");

      final bytes=await _image!.readAsBytes();
      final base64img=base64Encode(bytes);
     Map mp;
      if(res != null){
        ls=jsonDecode(res!);
        mp={
          "fname":c1.text,
          "lname":c2.text,
          "email":c3.text,
          "phone":c4.text,
          "photo":base64img!,
        };
        ls[indexnumber!]= mp;
        print(ls);
        prefs.setString("contactbook", jsonEncode(ls));
      }
      else{
          mp={
          "fname":c1.text,
          "lname":c2.text,
          "email":c3.text,
          "phone":c4.text,
          "photo":base64img!,
        };
        ls[indexnumber!]= mp;
        print(ls);
        prefs.setString("contactbook", jsonEncode(ls));
      }
      c1.clear();
      c2.clear();
      c3.clear();
      c4.clear();
      // setState(() {
      //     _image=null;
      // });
    
    }


  @override
  Widget build(BuildContext context) {
    indexnumber=int.parse(ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Center(child: Text("Edit Contact",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),),
      ),
      body: ListView(
        children: [
        Container(
                height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           color: Colors.black,
           padding: EdgeInsets.all(50),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        Container(height: 30,),
              Container(
                height: 150,
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[200],
                ),
                child:
                GestureDetector(
                  onTap: () {
                    pickimage();
                  },
                  // child: Image.memory(_inputimage!),
                  // child:img?Image.file(_image!,fit: BoxFit.cover,)
                  // :Text("Set New Image")
                    child:img ? ClipOval(child: Image.file(_image!,fit: BoxFit.cover,height: 150,width: 150,),)
                :Text("Set New Image")
                )
              ),
              // _______
              SizedBox(height: 50,),
              Container(
                width: 350,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("FName",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),),
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
              Container(
                width: 350,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Lname",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),),
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
                  Text("Email",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),),
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
                  Text("Number",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),),
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
        style: TextButton.styleFrom(backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 22, 20, 22)
        ),
        onPressed: () {
        if (_image!=null){
           AddData();
           Navigator.pop(context);
          }
          else{
            showDialog(context: context, builder: (context) {
             return AlertDialog(
                title: Text("Sorry!!!"),
                content: Text("Image is mandotory.."),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("OK"))
                ],
              );
            },);
          }
      }, child:Text("Save")),
    );
  }
}
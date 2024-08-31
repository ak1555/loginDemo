import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

int? indexnumber;
Uint8List? _image;
List ls=[];

void details() async{
  final prefs=await SharedPreferences.getInstance();
  final res=prefs.getString("contactbook");


if(res!=null){
  setState(() {
     ls=json.decode(res!);
 _image=base64Decode(ls![indexnumber!]["photo"]);
  });

}else{
 print("empty res");
}
print(ls[indexnumber!]);

}

void delete() async{
  final prefs=await SharedPreferences.getInstance();
  final res=prefs.getString("contactbook");
  setState(() {
     ls=json.decode(res!);
    ls.removeAt(indexnumber!);
  });
 prefs.setString("contactbook", jsonEncode(ls));
 Navigator.pop(context);
}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    details();
  }

  @override
  Widget build(BuildContext context) {

indexnumber=int.parse(ModalRoute.of(context)?.settings.arguments as String);

    return Scaffold(
      
    appBar: AppBar(
      
     title: Text("Details"),
     actions: [
      Icon(Icons.more_vert)],
    ),
    body:  Container(
      height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
       padding: EdgeInsets.only(left: 50,right: 50),
       child: Column(
        children: [
       
          Container(height: 250,
          width: double.infinity,
          alignment: Alignment.center,

          child: ClipOval(child:Image.memory(_image!,height: 150,width: 150,)),

          ),

          Container(child: Divider(),),
          Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [

                  Text(ls[indexnumber!]["fname"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),Text(" "),
                  Text(ls[indexnumber!]["lname"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)

                ],),
                Icon(Icons.call)
              ],
            ),
          ),

           Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(children: [

              Text(ls[indexnumber!]["phone"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            
            ],),
          ),
          Container(height: 20,),
          Container(child: Divider(),),
           Container(height: 20,),
          Container(
            width: double.infinity,
            height: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/editfile",arguments: indexnumber.toString());
              },
              child: Text("Edit"),),
          ),
          Container(
            width: double.infinity,height: 30,
            child: GestureDetector(onTap:() {
              delete();
            },
              child: Text("Delete Contact"),),
          ),
           Container(height: 20,),
        Text("Call History"),
       
        ],
       ),
    ));
  }
}
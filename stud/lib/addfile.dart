import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  TextEditingController c5=TextEditingController();
  TextEditingController c6=TextEditingController();
  TextEditingController c7=TextEditingController();
  TextEditingController c8=TextEditingController();
  void addd() async{
final prefs= await SharedPreferences.getInstance();
final res= prefs.getString("Todos");
try{
  List<dynamic> ls=json.decode(res!);
Map<dynamic,dynamic>mp=
  {"name":c1.text,
  "age":c2.text,
  "class":c3.text,
  "id":c4.text,
  "eng":c5.text,
  "mal":c6.text,
  "hin":c7.text,
  };
  ls.add(mp.toString());
  prefs.setString("Todos", json.encode(ls));
  print(ls);
}
catch(error){
  List<Map<dynamic,dynamic>>lsmp=[{
    "name":c1.text,
  "age":c2.text,
  "class":c3.text,
  "id":c4.text,
  "eng":c5.text,
  "mal":c6.text,
  "hin":c7.text,
  }];
  print(lsmp);
  prefs.setString("Todos", json.encode(lsmp));
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
Container(height: 50,),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[200],
              ),
              child: Icon(Icons.perm_identity_rounded,size: 110,),
            ),
            // ___________________________________________________
            SizedBox(height: 50,),
            Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("FullName",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                SizedBox(height: 2),
                Expanded(flex: 0, child: TextField(
                  controller: c1,
                  decoration: InputDecoration(
                  labelText: "Name",
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
                Text("Age",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                SizedBox(height: 2),
                Expanded(flex: 0, child: TextField(
                   controller:c2,
                   decoration: InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                ),)
              ],),),
            Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Class",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                SizedBox(height: 2),
                Expanded(flex: 0, child: TextField(
                   controller:c3,
                  decoration: InputDecoration(
                  labelText: "Class",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                ),)
              ],),),
            Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("ID",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                SizedBox(height: 2),
                Expanded(flex: 0, child: TextField(
                   controller:c4,
                  decoration: InputDecoration(
                  labelText: "Id",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                ),)
              ],),),


              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.only(left: 50),
                child: Row(children: [
                  Container(height: 50,alignment: Alignment.bottomCenter, child: Text("MARKS:")),
                  SizedBox(width: 10,),
                  Container(height: 50,width: 90,
              child: Column(children: [Text("ENG"),Expanded(child: TextField(
                 controller:c5,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ))],),
              ),
SizedBox(width: 10),
                Container(height: 50,width: 90,
              child: Column(children: [Text("MAL"),Expanded(child: TextField(
                 controller:c6,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ))],),
              ),
              SizedBox(width: 10),
                Container(height: 50,width: 90,
              child: Column(children: [Text("HIN"),Expanded(child: TextField( 
                controller:c7,
                decoration: InputDecoration( border: OutlineInputBorder()),
              ))],),
              ),
                ],),
              ),
              SizedBox(height: 25,),   
          ],
         ),
      ),
      floatingActionButton: IconButton(
        style: IconButton.styleFrom(backgroundColor: Colors.green,
        foregroundColor: Colors.white),
        onPressed: () {
        addd();
      }, icon: Icon(Icons.add,size: 40,)),
    );
  }
}
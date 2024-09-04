import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
Uint8List? _image;
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
    // _image=base64Decode();
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
        backgroundColor: Colors.black,
        title: Center(child: Text("CONTACTS",style: TextStyle(color: Colors.white),),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        // alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15,right: 15,top:40,bottom: 10 ),
        child: ListView.builder(
          itemCount: ls.length,
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5,bottom: 5),
              decoration: BoxDecoration(
                
                border: Border.all(color: Colors.grey,width: 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context,"/detail",arguments: index.toString() );
                },
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(color: Colors.grey,
                  borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                    child: Image.memory(_image=base64Decode(ls![index]["photo"]),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(100),
                  )
                ),
                title: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 30,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 15,),
                              Row( 
                                mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              
                                children: [
                                  Text(ls[index]["fname"],style: TextStyle(fontSize: 17.5,color: Colors.white)),
                                  Text(" "),Text(ls[index]["lname"],style: TextStyle(fontSize: 17.5,color: Colors.white))],),
                            ],
                          ),
                          // SizedBox(width: 50,),
                           Container(
                  width: 60,
                  // height: 50,
                  alignment: Alignment.bottomCenter,
                  child: Row(children: [
                    // Container(
                    //   height: 35,width: 35,
                    //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                    //   color: Colors.grey[300]),
                      // child:
                       Icon(Icons.message,color: Colors.blue,),
                      // ),
                      SizedBox(width: 8,),
                  Icon(Icons.call,color: Colors.green,)],),
                ),
                        ],
                      ),
                    ),
                  Text(ls[index]["phone"],style: TextStyle(fontSize: 12,color: Colors.white),)
                  ],
                ),
                // trailing:
                // Icon(Icons.call,color: Colors.green,),
                
              ),
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
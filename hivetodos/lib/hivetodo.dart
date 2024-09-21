import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class HiveTodos extends StatefulWidget {
  const HiveTodos({super.key});
  @override
  State<HiveTodos> createState() => _HiveTodosState();
}
class _HiveTodosState extends State<HiveTodos> {
      TextEditingController c1 = TextEditingController();
       TextEditingController c2 = TextEditingController();
        TextEditingController c3 = TextEditingController();
         TextEditingController c4 = TextEditingController();
          TextEditingController c5 = TextEditingController();
           TextEditingController c6 = TextEditingController();
    final mybox= Hive.box('mybox');
List ls=[];
void lsli(){
  try{
  ls=mybox.get(1);
  }catch(e){
  }
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsli();
  }
      void add(){
        // List ls=[];
        var name=c1.text;
        var cls=c2.text;
        var id=c3.text;
        var phy=c4.text;
        var che=c5.text;
        var bio=c6.text;
        Map mp={
          "phy":phy,
          "che":che,
          "bio":bio
        };
        ls.add({
          "name":name,
          "cls":cls,
          "id":id,
         "marks":mp
        });
        mybox.put(1, ls);
        print(mybox.get(1));
      c1.clear();
      c2.clear();
      c3.clear();
      c4.clear();
      c5.clear();
      c6.clear();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ADD LIST",style: TextStyle(fontWeight: FontWeight.bold),),),
       actions: [  IconButton(onPressed: () {
          Navigator.pushNamed(context, "details");
        }, icon: Icon(Icons.arrow_forward)),],
        ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 50,right: 50,bottom:50,top: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * .9,
          width: 500,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 0.5,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(15),         
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Title(color: Colors.black, child: Text("DETAILS",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),             
              SizedBox(height: 30,),
              Row(
                children: [
                  Container(width: 45, child:
                   Text("NAME",style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(width: 20,),
                  Expanded(child: TextField(
                    controller: c1,
                    decoration:
                     InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.values.last,
                          width: .2,
                          color: const Color.fromARGB(255, 65, 0, 241),
                          ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: .5,
                            color: Color.fromARGB(255, 247, 102, 6)
                          // color: const Color.fromARGB(255, 65, 0, 241)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),                       
                      )
                      
                      ),
                  ))
                ],
              ),
SizedBox(height: 22,),
          Row(
                children: [
                  Container(width: 45, child: Text("CLASS",style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(width: 20,),
                  Expanded(child: TextField(
                    controller: c2,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.values.last,
                          width: .2,
                          color: const Color.fromARGB(255, 65, 0, 241),
                          ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: .5,
                            color: Color.fromARGB(255, 247, 102, 6)
                          // color: const Color.fromARGB(255, 65, 0, 241)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),                       
                      )
                      
                      ),
                  ))
                ],
              ),
SizedBox(height: 22,),
              Row(
                children: [
                  Container(width: 45, child: Text("ID",style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(width: 20,),
                  Expanded(child: TextField(
                    controller: c3,
                    decoration:InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.values.last,
                          width: .2,
                          color: const Color.fromARGB(255, 65, 0, 241),
                          ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: .5,
                            color: Color.fromARGB(255, 247, 102, 6)
                          // color: const Color.fromARGB(255, 65, 0, 241)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),                       
                      )
                      
                      ),
                  ))
                ],
              ),
SizedBox(height: 22,),
Text("MARKS:",style: TextStyle(
  fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 18
),),
          SizedBox(height: 17,),
Container(
                    width: 150,
                    height: 50,
                    child: Row(
                children: [
                  Text("phy",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 20,),
                  Expanded(child: TextField(
                    controller: c4,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.values.last,
                          width: .2,
                          color: const Color.fromARGB(255, 65, 0, 241),
                          ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: .5,
                            color: Color.fromARGB(255, 247, 102, 6)
                          // color: const Color.fromARGB(255, 65, 0, 241)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),                       
                      )
                      
                      ),
                  ))])),
SizedBox(height: 15,),
                  Container(
                    width: 150,
                    height: 50,
                    child: Row(
                children: [
                  Text("che",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 20,),
                  Expanded(child: TextField(
                    controller: c5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.values.last,
                          width: .2,
                          color: const Color.fromARGB(255, 65, 0, 241),
                          ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: .5,
                            color: Color.fromARGB(255, 247, 102, 6)
                          // color: const Color.fromARGB(255, 65, 0, 241)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),                       
                      )
                      
                      ),
                  ))])),
SizedBox(height: 15,),
                  Container(
                    width: 150,
                    height: 50,
                    child: Row(
                children: [
                  Text("bio",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 20,),
                  Expanded(child: TextField(
                    controller: c6,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.values.last,
                          width: .2,
                          color: const Color.fromARGB(255, 65, 0, 241),
                          ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: .5,
                            color: Color.fromARGB(255, 247, 102, 6)
                          // color: const Color.fromARGB(255, 65, 0, 241)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),                       
                      )
                      
                      ),
                  ))])),
          SizedBox(height: 90,),
              MaterialButton(
                color: Color.fromARGB(255, 213, 128, 228),
                padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
                shape: BeveledRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(15)
                ),
                onPressed: () {
                  // if(c1!=""&&c2!=""&&c3!=""&&c4!=""&&c5!=""&&c6!=""){
                    add();
                  // }else{
                  //   showDialog(context: context, builder: (context) {
                  //     return AlertDialog(
                  //       title: Text("OOPS!!!"),
                  //     );
                  //   },);
                  // }
                
              },child: Text("SUBMIT",style: TextStyle(
                fontWeight: FontWeight.bold,letterSpacing: 2,
                shadows: [Shadow(color: Colors.black,blurRadius: 3,offset: Offset(2, 2))]
              ),),)
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {
  List ls=[];
  var box=Hive.box("mybox");
void callfuntion(){
  
  ls=box.get(1);
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    callfuntion();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 255, 247, 247),
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 255, 247, 247) ,
        title: Center(child: Text("DETAILS"),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 15,bottom: 5,top: 28),
          // height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [BoxShadow(color: Colors.black,blurRadius: 7,spreadRadius: 2)],
            border: Border.all(width: .3)
          ),
          child: ListView.builder(
            itemCount: ls.length,
            itemBuilder: (context, index) {
            return Container(
              height: 170,
              padding: EdgeInsets.only(top: 9,left: 7),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                
                color: const Color.fromARGB(255, 255, 247, 247),
                border: Border.all(width: .1),
                boxShadow: [BoxShadow(color: const Color.fromARGB(255, 124, 3, 3),
                blurRadius: 5,blurStyle: BlurStyle.outer,spreadRadius: 0)],
                borderRadius: BorderRadius.circular(12)
              ),
               child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        border: Border.all(width: .1),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      alignment: Alignment.center,
                      child: Text("${index+1}",style: TextStyle(color: Colors.white,
                        fontSize: 12,fontWeight: FontWeight.w600
                      ),),
                    ),
                  ],
                ),
                SizedBox(width: 13,),
                Container(
                  width: 250,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("NAME :  ",style: TextStyle(fontSize: 12),),
                          Text(ls[index]["name"].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                           Text("CLASS :  ",style: TextStyle(fontSize: 12),),
                          Text(ls[index]["cls"].toString()),
                        ],
                      ),
                      // Text(ls[index]["id"].toString()),
                      Text("MARKS:",style: TextStyle(decoration: TextDecoration.underline),),
                      Row(children: [
                         SizedBox(width: 13,),
                        Icon(Icons.arrow_right_rounded),
                        Text("physics:  "),
                         Text(ls[index]["marks"]["phy"].toString()),
                      ],),
                       Row(children: [
                         SizedBox(width: 13,),
                        Icon(Icons.arrow_right_rounded),
                        Text("chemistry:  "),
                         Text(ls[index]["marks"]["che"].toString()),
                      ],),
                       Row(children: [
                         SizedBox(width: 13,),
                        Icon(Icons.arrow_right_rounded),
                        Text("biology:  "),
                         Text(ls[index]["marks"]["bio"].toString()),
                      ],),
                    ],
                  ),
                ),


                SizedBox(width: 30,),
                SizedBox(width: 15,),
                
                
                 Column(
                   children: [
                    SizedBox(height: 3),
                     Container(
                      height: 35,
                      width: 65,
                      decoration: BoxDecoration(
                        border: Border.all(width: .5,color: Colors.red,style:BorderStyle.solid),
                        borderRadius: BorderRadius.circular(5)
                      ),alignment: Alignment.center,
                       child: GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Text("SURE ?"),
                              content: Text("Are You Want To Delete?"),
                              actions: [TextButton(onPressed: () {
                                setState(() {
                                   ls.removeAt(index);
                                    box.put(1, ls);
                                });
                                Navigator.pop(context);
                              }, child: Text("OK"))],
                            );
                          },);
                        },
                         child: Text("ID: ${ls[index]["id"].toString()}",style: TextStyle(
                          color: Colors.red[600]
                         ),),
                       ),
                     ),
                   ],
                 ),
              ],
            ));
          },),
        ),
      ),
    );
  }
}
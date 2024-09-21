import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {
  List ls=[];
void callfuntion(){
  var box=Hive.box("mybox");
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
      appBar: AppBar(
        title: Center(child: Text("DETAILS"),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 35,right: 35,top: 15,bottom: 15),
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
            return Container(height: 70,padding: EdgeInsets.only(top: 3), child: Row(
              children: [
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    border: Border.all(width: .1),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  alignment: Alignment.center,
                  child: Text(index.toString(),style: TextStyle(
                    fontSize: 12,fontWeight: FontWeight.w600
                  ),),
                ),SizedBox(width: 13,),
                Column(
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
                  ],
                ),
                SizedBox(width: 60,),
                Text("phy:  "),
                Text(ls[index]["marks"]["phy"].toString()),
                SizedBox(width: 15,),
                 Column(
                   children: [
                    Text("MARKS:"),
                    SizedBox(height: 2,),
                     Row(
                       children: [
                         Text("che:  "),
                           Text(ls[index]["marks"]["che"].toString()),
                       ],
                     ),
                   ],
                 ),
                 SizedBox(width: 15,),
                 Text("Bio:  "),
                Text(ls[index]["marks"]["bio"].toString()),

                SizedBox(width: 15,),
                 Column(
                   children: [
                     GestureDetector(
                      onTap: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text("SURE ?"),
                            content: Text("Are You Want To Delete?"),
                            actions: [TextButton(onPressed: () {
                              setState(() {
                                 ls.remove(index);
                              });
                              Navigator.pop(context);
                            }, child: Text("OK"))],
                          );
                        },);
                      },
                       child: Text("ID:${ls[index]["id"].toString()}",style: TextStyle(
                        color: Colors.red
                       ),),
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
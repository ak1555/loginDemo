import 'dart:convert';
import 'dart:typed_data';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.black,
     title: Center(child: Text("Details",style: TextStyle(color: Colors.white),)),
     actions: [
      Icon(Icons.more_vert,color: Colors.white,)],
    ),
    body:  Container(
      height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
      //  padding: EdgeInsets.only(left: 10,right: 10),
      color: Colors.black,
       child: Column(
        children: [
       SizedBox(height: 30,),
          Container(
            // padding: ,
            // height: 200,
          // width: double.infinity,
          alignment: Alignment.center,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipOval(child:Image.memory(_image!, height: 100,width: 100,fit: BoxFit.cover,)),

               Container(
            height: 100,
            // width: double.infinity,
            alignment: Alignment.center,
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
            Text(ls[indexnumber!]["fname"],
            style: TextStyle(
              fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white,),),
            Text(" "),
            Text(ls[indexnumber!]["lname"],style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white),)

           ],),
          ),
            ],
          ),

          ),
            SizedBox(height: 75,),

          Container(
            // height: 50,
            width: double.infinity,
            alignment: Alignment.center,
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                 Container(
            height: 50,
            width: 100,    
            padding: EdgeInsets.only(left: 6,right: 6),  
            decoration: BoxDecoration(
               color: Colors.red,
               boxShadow: [BoxShadow(
                color: Colors.grey,
                blurRadius: 1.5,spreadRadius: 1.5,
                //  offset: Offset(.5, .5)
               )],
               borderRadius: BorderRadius.circular(100)
            ),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.video_call),
                Text("VIDEO")
              ],
            ),
           ),

           Container(
            height: 50,
            width: 100,      
            padding: EdgeInsets.only(left: 8,right: 8),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
                color: Colors.grey,
                blurRadius: 1.5,spreadRadius: 1.5,
                // offset: Offset(.5, .5)
               )],
               color: Colors.green,
               borderRadius: BorderRadius.circular(100)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.call),
                Text("CALL")
              ],
            ),
           ),

             Container(
            height: 50,
            width: 106,      
            padding: EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
                color: Colors.grey,
                blurRadius: 1.5,spreadRadius: 1.5,
                //  offset: Offset(.5, .5)
               )],
               color: Colors.blue,
               borderRadius: BorderRadius.circular(100)
            ),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.message),
                Text("MESSAGE")
              ],
            ),
           ),

           ],),
          ),
          SizedBox(height: 35,),
          Container(
            height: 250,
            width: double.infinity,
            // color:Colors.grey[700],
            padding: EdgeInsets.only(left: 15,right: 25,top: 13,bottom: 10),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Mobile",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white),),
                           Text(ls[indexnumber!]["phone"],style: TextStyle(color: Colors.white,fontSize: 18),),
                        ],),
                      ),
                      

                      // Row(
                      //   children: [
                      //     Container(
                      //       height: 35,
                      //       width: 35,
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(100)
                      //       ),
                      //       child: Icon(Icons.message,size: 22,color: Colors.blue[900],),
                      //     ),
                      //     SizedBox(width: 13,),
                      //      Container(
                      //       height: 40,
                      //       width: 40,
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(100)
                      //       ),
                      //       child: Icon(Icons.call,size: 22,color: Colors.green,),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //     Text("Group",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
                      //      Text("invite friends",style: TextStyle(color: Colors.white),),
                      //   ],),
                      // ),
                      
                    ],
                  ),
                ),
                // SizedBox(height: 25,),

                 Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // alignment: Alignment.centerLeft,
                        width: 160,
                        height: 50,
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("Email",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white),),
                           Text(ls[indexnumber!]["email"],style: TextStyle(fontSize: 186,color: Colors.white)),
                           Center(child: Text("California"),)
                        ],),
                      ),
                      
                           Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Icon(Icons.email,size: 22,color: Colors.blue[400],),
                          )
                       
                    ],
                  ),
                ),
                SizedBox(height: 18,),
                Container(padding: EdgeInsets.only(left: 15,right: 15), child: Divider(),),
SizedBox(height: 18,),
              Container(width: double.infinity,
                child: Text("Invite Group",style: TextStyle(color: Colors.white,fontSize: 13),)),

SizedBox(height: 15,),

                 Container(width: double.infinity,
                child: Text("Call Managements",style: TextStyle(color: Colors.white,fontSize: 13),))
                
              ],
            ),
          ),

          // Container(height: 40,
          // padding: EdgeInsets.only(left: 15),
          // alignment: Alignment.centerLeft,
          // child: Text("More Options",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),),),

          // Container(
          //   height: 150,
          //   width: double.infinity,
          //   // color: Colors.grey[700],
          //    padding: EdgeInsets.only(left: 15,right: 19,top: 13,bottom: 10),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //             Text("Share Contact",style: TextStyle(color: Colors.white),),
          //             Container(
          //                   height: 35,
          //                   width: 35,
          //                   decoration: BoxDecoration(
          //                     color: Colors.white,
          //                     borderRadius: BorderRadius.circular(100)
          //                   ),
          //                   child: Icon(Icons.share,size: 22,color: Colors.grey[800],),
          //                 )
          //         ],
          //       ),
              
          //       GestureDetector(
          //        onTap: () {
          //          showDialog(context: context, builder: (context) {
          //            return AlertDialog(
          //              title: Container(
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Title(color: Colors.black, child: Text("Alert!",style: TextStyle(letterSpacing: 1.5),)),
          //                       IconButton(onPressed: () {
          //                         Navigator.pop(context);
          //                       }, icon: Icon(Icons.settings_backup_restore_rounded))
          //                     ],
          //                   ),
          //                 ),
          //                 content: Text("Are you sure to delete?"),
          //                 actions: [
          //                   TextButton(onPressed: () {
          //                     delete();
          //                     Navigator.pop(context);
          //                   }, child: Text("Delete")),
          //                 ],
          //            );
          //          },);
          //        },
               
          //         child: Text("Delete Contact",style: TextStyle(color: Colors.red),)),

          //         GestureDetector(
          //           onTap: () {
          //             // showDialog(context: context, builder: (context) {
          //             //   return 
          //             // },);
          //                Navigator.pushNamed(context, "/editfile",arguments: indexnumber.toString());
          //           },
          //           child: Text("Edit",style: TextStyle(color: Colors.blue)),
          //         )
          //     ]
          //     )
          //     ),


          //      Container(height: 40,
          // padding: EdgeInsets.only(left: 15),
          // alignment: Alignment.centerLeft,
          // child: Text("Account Linked",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),),),


          // Container(
          //   height: 70,
          //   width: double.infinity,
          //   color: Colors.grey[700],
          //    padding: EdgeInsets.only(left: 15,right: 25,top: 13,bottom: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text("facebook",style: TextStyle(color: Colors.white),),
          //      Container(
          //                   height: 35,
          //                   width: 35,
          //                   decoration: BoxDecoration(
          //                     // color: Colors.white,
          //                     borderRadius: BorderRadius.circular(100)
          //                   ),
          //                   child: Icon(Icons.facebook,size: 36,color: Colors.blue,),
          //                 )
          //     ],
          //   )),



        ],
       ),
    ),
    bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black,
      items: [
      BottomNavigationBarItem( icon:GestureDetector(onTap: () {
        print("object");
      }, child:Icon(Icons.star_border_purple500_sharp,size: 30,) ,) ,label: "",),

         BottomNavigationBarItem( icon:GestureDetector(onTap: () {
        delete();
        Navigator.pop(context);
      }, child:Icon(Icons.delete,color: Colors.red,size: 30,) ,) ,label: "",),
        BottomNavigationBarItem( icon:GestureDetector(onTap: () {
         Navigator.pushNamed(context, "/editfile",arguments: indexnumber.toString());
      }, child:Icon(Icons.edit,color: Colors.blue,size: 30,) ,) ,label: "",),
    ]),
    );
  }
}
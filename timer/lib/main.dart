import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:timer/timer.dart';

void main(){
runApp(MyTimerApp());
}

class MyTimerApp extends StatefulWidget {
  const MyTimerApp({super.key});

  @override
  State<MyTimerApp> createState() => _MyTimerAppState();
}

class _MyTimerAppState extends State<MyTimerApp> {
   Timer? _timer;
  DateTime ctime=DateTime.now();
  String? ftime;
  String? M,Z="";
  String? dateFormat;
  int? Q;
  @override
  void initState(){
super.initState();
 _starttime();
  }
  void _starttime(){
    _timer=Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        ctime=DateTime.now();
        ftime="${ctime.hour.toString().padLeft(2,"0")}:${ctime.minute.toString().padLeft(2,"0")}";
       int M=int.parse(ctime.hour.toString());
       if(M>=12){
        Z="PM";
       Q = M - 12;
       }else{Z="AM";}
      });
    },);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Center(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //=========================================container1
              Container(height: 100,
              width: 70,
             decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(15)
             ),alignment: Alignment.center,
             child: Text(Q.toString().padLeft(2,"0"),style: TextStyle(
              fontSize: 30,
              color: Colors.white
             ),),
             ),SizedBox(width: 5,),
             //=============================================container 1
             Text(":",style: TextStyle(
              fontSize: 50,
              color: Colors.white
             )),SizedBox(width: 5,),
             //+++++++++++++++++++++++++text
             //=============================================container 2
               Container(height: 100,
              width: 70,
             decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(15)
             ),alignment: Alignment.center,
             child: Text(ctime.minute.toString().padLeft(2,"0"),style: TextStyle(
              fontSize: 30,
              color: Colors.white
             ),),
             ),SizedBox(width: 5,),
             //=============================================container 2
              //=============================================container 3
               Container(height: 100,
              width: 70,
             decoration: BoxDecoration(
              // color: Colors.grey[500],
              borderRadius: BorderRadius.circular(15)
             ),alignment: Alignment.bottomLeft,
             child: Column(
               children: [
                Container(height: 40,),
                 Text( ctime.second.toString().padLeft(2,"0"),style: TextStyle(
            //   fontSize: 50,
              color: Colors.white
             )),
                 Text( Z.toString(),style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
                 ),),
                //  Text(ctime.weekday.toString(),style: TextStyle(color: Colors.white,fontSize: 10),)
               ],
             ),
             ),
             //=============================================container 3
            ],),
          )
          ),
      ),
    );
  }
}
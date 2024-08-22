import 'package:flutter/material.dart';
import 'package:movinglogin/flders/demo1.dart';
import 'package:movinglogin/flders/demo2.dart';
import 'package:movinglogin/flders/homepage.dart';
import 'package:movinglogin/flders/loginpage.dart';
void main(){
  runApp(MaterialApp(
    // 
    //home:HomePage() ;

initialRoute: "/home",
routes: {
"/home":(context)=>HomePage(),
'/log':(context)=>LoginPage(),
'demo1':(context)=>demo1(),
'demo2':(context)=>demo2(),
}
  )
);

}
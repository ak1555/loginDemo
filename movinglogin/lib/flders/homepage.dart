import 'package:flutter/material.dart';
import 'package:movinglogin/flders/loginpage.dart';
import 'package:movinglogin/flders/signup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: Column(
            children: [
              Container(),
              Container(height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("Welcome to Edu",style: TextStyle(color: Colors.white,fontSize: 30),),),

              Container(child: Image.asset('./images/h.jpeg'),),
              
                ElevatedButton(style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage(),));
            },
            child: Text(" signup button ")),

SizedBox(height: 20,),
              ElevatedButton(style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
            },
             child: Text("  login button  "))

            ],
          ))
      ),
    );
  }
}
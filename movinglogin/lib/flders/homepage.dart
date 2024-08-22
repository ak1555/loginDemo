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
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: Column(
            children: [
              Container(),
              Container(height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("Welcome to Edu",style: TextStyle(color: Colors.purple[900],fontSize: 30),),),

              Container(
                // height: 300,
                // width: 300,
                // padding: EdgeInsets.all(10),
                child: Image.asset('./images/picture1.jpg'),),
              
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage(),));
            },
            child: Text(" signup button ")),

SizedBox(height: 20,),
              ElevatedButton(style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
            },
             child: Text("  login button  ")),
             SizedBox(height: 10),
               ElevatedButton(style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  // Navigator.pop(context);
                  //  Navigator.maybePop(context);
                 if(Navigator.canPop(context)){
                  Navigator.pop(context);
                 }else{
                  print("canoot pop");
                 }
            },
             child: Text("  back  "))


            ],
          ))
      ),
    );
  }
}
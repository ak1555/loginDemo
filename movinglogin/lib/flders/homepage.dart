import 'package:flutter/material.dart';
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: Stack(
          children: [
            // Expanded(child: child)
            // Image(image: AssetImage("./images/home.jpeg",)),
            Container(
               height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
              child: Image.asset("./images/home2.jpeg",fit: BoxFit.cover,),
            )
            ,
            Positioned(
              top: 600,
              right:  190,
              child: ElevatedButton(style: ButtonStyle(),
                onPressed: () {
              
            }, child: Text("  login button  "))), Positioned(
              top: 650,
              right: 190,
              child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
            }, child: Text("  signup button  ")))
          ],
        ),)
      ),
    );
  }
}
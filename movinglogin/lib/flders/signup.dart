import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              child: Image.asset("./images/sign.jpeg",fit: BoxFit.cover,),
            )
            ,
            // Positioned(
            //   top: 600,
            //   right:  190,
            //   child: ElevatedButton(style: ButtonStyle(),
            //     onPressed: () {
              
            // }, child: Text("  login button  "))), Positioned(
            //   top: 650,
            //   right: 190,
            //   child: ElevatedButton(onPressed: () {
              
            // }, child: Text("  signup button  ")))
          ],
        ),)
      ),
    );
  }
}
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
       body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
                Container(height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("WelCome",style: TextStyle(color: Colors.white,fontSize: 25),),),
            Stack(
              children: [
                Row(
                  children: [
                    Container(width: 10,),
                    Container(
                       height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width * .90,
                      child: Image.asset("./images/l.jpeg",fit: BoxFit.cover,),
                    ),
                  ],
                )
                ,
                  Positioned(
                  top: MediaQuery.of(context).size.height*.5,
                  right:  MediaQuery.of(context).size.width*.3,
                  child: Container(
                    height: 30,width: 200,
                   decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                   ),
                    child: Expanded(child: TextField(decoration: InputDecoration(labelText:"username"),)),
                  )), 
                    Positioned(
                  top: MediaQuery.of(context).size.height*.6,
                  right:  MediaQuery.of(context).size.width*.3,
                  child: Expanded(
                    child: Container(
                    height: 30,width: 200,
                   decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                   ),
                    child: Expanded(child: TextField(decoration: InputDecoration(labelText:"password"),)),
                  ))), 
              ],
            ),
            ]),
          
        
      ),
    );
  }
}
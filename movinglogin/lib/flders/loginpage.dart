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
      // appBar: AppBar(),
       body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
                Container(height: 100,
              width: double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  Text("SIGNUP",style: TextStyle(color: Colors.purple[900],fontSize: 25),),
               Container(width: 20,)
               ],
              ),),
              Container(
                child: Image.asset('./images/picture2.jpg',),
              ),
              SizedBox(height: 50,),
              Container(height: 40,width: 200,
              decoration: BoxDecoration(color: Colors.purple[400],
                borderRadius: BorderRadius.circular(10)),
                child:  Expanded(child: TextField(decoration: InputDecoration(
                  labelText:"USERNAME",
                  suffixIcon: Icon(Icons.account_circle_outlined,size: 18,)),)),
              ),
SizedBox(height: 10),
                Container(
                  height: 40,width: 200,
                decoration: BoxDecoration(color: Colors.purple[400],
                borderRadius: BorderRadius.circular(10)),
                child:  Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye,size: 18,),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  fillColor: Colors.amber,
                  hoverColor: Colors.yellow,
                  focusColor: Colors.green,
                  labelText:"PASSWORD",),)),
              ),

              SizedBox(height: 25,),
                ElevatedButton(style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage(),));
            },
            child: Text(" signup button ")),


            ]),
          
        
      ),
    );
  }
}
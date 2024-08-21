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
        color: Colors.black,
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
              child: Image.asset("./images/s.jpeg",fit: BoxFit.cover,),
            )
            ,
            Positioned(
              top: MediaQuery.of(context).size.height*.5,
              right:  MediaQuery.of(context).size.width*.3,
              child:  Container(
                height: 20,width: 150,
                color: Colors.white,
                child: Expanded(child: TextField()),
              )), 
                 Positioned(
                  top: MediaQuery.of(context).size.height*.5,
                  right:  MediaQuery.of(context).size.width*.3,
                  child: Container(
                    height: 30,width: 200,
                   decoration: BoxDecoration(
                   color: const Color.fromARGB(255, 241, 165, 165),
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
                    color: const Color.fromARGB(255, 241, 165, 165),
                    borderRadius: BorderRadius.circular(5)
                   ),
                    child: Expanded(child: TextField(decoration: InputDecoration(labelText:"password"),)),
                  ))), 
                  
                 Positioned(
                  top: MediaQuery.of(context).size.height*.7,
                  left:  MediaQuery.of(context).size.width*.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                    backgroundColor: Colors.blue,foregroundColor: Colors.white),
                    onPressed: () {
                    
                  }, child: Text("Login"))
                  )
          ],
        ),)
      ),
    );
  }
}
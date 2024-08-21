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
                  Text("LOGIN",style: TextStyle(color: Colors.purple[900],fontSize: 25),),
               Container(width: 50,)
               ],
              ),),
                Container(
                  child: Image.asset("./images/picture3.jpg",fit: BoxFit.cover,),
                ),
                    Container(
                        height: 30,width: 200,
                       decoration: BoxDecoration(
                       color: Colors.purple[500],
                        borderRadius: BorderRadius.circular(5)
                       ),
                        child: Expanded(child: TextField(
                          decoration: InputDecoration(
                            labelText:"UserName",),)),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        height: 30,width: 200,
                       decoration: BoxDecoration(
                        color: Colors.purple[500],
                        borderRadius: BorderRadius.circular(5)
                       ),
                        child: Expanded(child: TextField(decoration: InputDecoration(labelText:"password"),)),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  
            },
            child: Text(" signup button ")),
             
          ],
        ),)
      
    );
  }
}
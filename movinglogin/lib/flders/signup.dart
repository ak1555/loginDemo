import 'package:flutter/material.dart';
import 'package:movinglogin/flders/demo1.dart';

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
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                      Container(width: MediaQuery.of(context).size.width *.80,alignment: Alignment.center,
                  child: 
                  Text("LOGIN",style: TextStyle(color: Colors.purple[900],fontSize: 25),),
              ), Container(width: 50,)
               ],
              ),),
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset("./images/picture3.jpg",fit: BoxFit.cover,),
                ),
                SizedBox(height: 70,),
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                        height: 40,width: 250,
                       decoration: BoxDecoration(
                       color: Colors.purple[500],
                        borderRadius: BorderRadius.circular(5)
                       ),
                        child: Row(
                          children: [
                            Container(child: Icon(Icons.account_circle_outlined,size: 18),),
                            SizedBox(width: 10,),
                            Expanded(child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText:"UserName",fillColor: Colors.white),)),
                          ],
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container( padding: EdgeInsets.only(bottom: 8),
                        height: 40,width: 250,
                       decoration: BoxDecoration(
                        color: Colors.purple[500],
                        borderRadius: BorderRadius.circular(5)
                       ),
                        child: Row(children: [
                        Container(child: Icon(Icons.lock,size: 18,),),
                            SizedBox(width: 10,),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                               suffixIcon: Icon(Icons.remove_red_eye,size: 18,color: Colors.white,),
                              labelText:"password"),)),
                     ],) ),
                      SizedBox(height: 20,),
                      ElevatedButton(style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  // Navigator.pushNamed(context, '/demo1');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => demo1(),));
            },
            child: Text(" signup button ")),
             SizedBox(height: 15,),
             Container(margin: EdgeInsets.only(left: 70,right: 70,),
             child: Divider(),),
             SizedBox(height: 15,),
             Container(
             
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text("Dont have an Account? Sign Up",
              style: TextStyle(fontSize: 12,wordSpacing: -1),),
             )
          ],
        ),)
      
    );
  }
}
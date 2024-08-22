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
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  Container(width: MediaQuery.of(context).size.width *.80,alignment: Alignment.center,
                  child: 
                  Text("SIGNUP",style: TextStyle(color: Colors.purple[900],fontSize: 25),),
              ), Container(width: 20,)
               ],
              ),),
              Container(
                height: 300,
                child: Image.asset('./images/picture2.jpg',),
              ),
              SizedBox(height: 50,),
              Container(height: 40,width: 200, padding: EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(color: Colors.purple[400],
                borderRadius: BorderRadius.circular(10)),
                child: Row(children: [
                        Container(child: Icon(Icons.lock,size: 18,),),
                            SizedBox(width: 10,), Expanded(child: TextField(decoration: InputDecoration(
                 border: InputBorder.none,
                  labelText:"USERNAME",
                  suffixIcon: Icon(Icons.account_circle_outlined,size: 18,)),))]),
              ),
SizedBox(height: 10),
                Container( padding: EdgeInsets.only(bottom: 8),
                  height: 40,width: 200,
                decoration: BoxDecoration(color: Colors.purple[400],
                borderRadius: BorderRadius.circular(10)),
                child:  
                Row(children: [
                        Container(child: Icon(Icons.lock,size: 18,),),
                            SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye,size: 18,),
                  border: InputBorder.none,
                
                  labelText:"PASSWORD",),))]),
              ),

              SizedBox(height: 25,),
                ElevatedButton(style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,backgroundColor: Colors.purple[900],
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage(),));
            },
            child: Text(" signup button ")),

             SizedBox(height: 50,),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("Already ahve an Account? Sign Up"),
              ),
              Container(height: 30,
                width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 70,right: 70),
              child: Row(children: [
                Container(width: 150,child: Divider(),),
                  Text("OR",style: TextStyle(color: Colors.purple[900]),),
                Container(width: 150,child: Divider(),)
              ],),
              ),

              Container(width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 1,),
                Container(height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.facebook_sharp,color: Colors.purple[900]),),

                 Container(height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.wechat_sharp,color: Colors.purple[900]),),

                 Container(height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.g_mobiledata_rounded,size: 30,color: Colors.purple[900],),),
                 Container(width: 1,)
              ],),)
,
             
            ]),
          
        
      ),
    );
  }
}
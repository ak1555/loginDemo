import 'package:flutter/material.dart';
import 'package:work/splash2.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {

Future<void> timedelay()async{
  Future.delayed(Duration(seconds: 2),() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homepage1(),));
  },);
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    timedelay();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.water_drop_outlined,color:  Colors.white,size: 115,),
            SizedBox(height: 20,),
            Text("WELCOME",style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 4
              
              ),)
          ],
        ),
      ),
    );
  }
}
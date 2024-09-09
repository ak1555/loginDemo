import 'package:flutter/material.dart';
import 'package:splash/splash2.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  Future<void> hidescreen()async{
    Future.delayed(Duration(seconds: 1),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Splash2(),));
    },);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    hidescreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flash_on,color: Colors.white,size: 130,),
            SizedBox(height: 25,),
            Text("Welcome To MyApp",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
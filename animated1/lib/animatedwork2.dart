import 'package:flutter/material.dart';

class AnimatedWork2 extends StatefulWidget {
  const AnimatedWork2({super.key});

  @override
  State<AnimatedWork2> createState() => _AnimatedWork2State();
}

class _AnimatedWork2State extends State<AnimatedWork2> {

TextEditingController c1=TextEditingController();
TextEditingController c2=TextEditingController();
int? sum;

void addd(){
  int a=int.parse(c1.text);
  int b=int.parse(c2.text);
  sum=a+b;
}


  bool _isopacity=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.only(top: 35,left: 15,right: 15),
           child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 160,
                    width: 220,
                    child: Column(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: c1,
                            decoration: InputDecoration(border: OutlineInputBorder()),)),
                        SizedBox(height: 10,),
                        Expanded(
                          child: TextField(
                            controller: c2,
                            decoration: InputDecoration(border: OutlineInputBorder()),)),
                      ],
                    ),
                  ),
                    SizedBox(width: 20,),
                    Container(height: 100,
                    width: 130,
                    // color: Colors.amber,
                   
                    child: TextButton(onPressed: () {
                      setState(() {
                        addd();
                        _isopacity=false;
                      });
                    }, child: Text("ADD INPUTS")),
                    )
                ],
              ),
              SizedBox(height: 105,),
                AnimatedOpacity(opacity: _isopacity?0:1, duration: Duration(milliseconds: 6000),
                child: Container(
                   alignment: Alignment.center,
                  height: 150,
                width: 150,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(sum.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
                )
            ],
           ),
      ),
    );
  }
}
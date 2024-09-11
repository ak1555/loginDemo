import 'package:flutter/material.dart';
import 'package:setstate1/setstate1.dart';

class SetState1 extends StatefulWidget {
  const SetState1({super.key});

  @override
  State<SetState1> createState() => _SetState1State();
}

class _SetState1State extends State<SetState1> {
List numbers=[1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("setstate1"),),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SetState2(numbers: numbers),));
          }, icon: Icon(Icons.arrow_forward_sharp))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text("lenght=${numbers.length}"),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
             return Center(child: Text(numbers[index].toString()));
              // Text("data");
            },),
          ),
      ],),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          numbers.add(numbers.last+1);
        });
      },child: Icon(Icons.add),),
    );
  }
}
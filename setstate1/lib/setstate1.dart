import 'package:flutter/material.dart';

class SetState2 extends StatefulWidget {
  final numbers;
  const SetState2({super.key,required this.numbers});

  @override
  State<SetState2> createState() => _SetState2State();
}

class _SetState2State extends State<SetState2> {
List numbers=[1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("setstate2"),),
       
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
     
          Text("lenght=${widget.numbers.length}"),
          SizedBox(height: 10,),
   
          Expanded(
            child: ListView.builder(
              itemCount: widget.numbers.length,
              itemBuilder: (context, index) {
             return Center(child: Text(widget.numbers[index].toString()));
              // Text("data");
            },),
          ),
        
      ],),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          widget.numbers.add(widget.numbers.last+1);
        });
      },child: Icon(Icons.add),),
    );
  }
}
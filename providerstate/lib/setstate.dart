import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/providerstatee/numberlistprovider.dart';
import 'package:providerstate/setstate2.dart';

class SetState1 extends StatefulWidget {
  const SetState1({super.key});

  @override
  State<SetState1> createState() => _SetState1State();
}

class _SetState1State extends State<SetState1> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<NumberListProvider>(
      builder: (context, NumberListModal, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Center(child: Text("SetState1"),),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SetState2(),));
            }, icon: Icon(Icons.arrow_forward_outlined))
          ],
        ),
        body: Column(
          children: [
            Text("lenght=${NumberListModal.numbers.length}"),

            Expanded(
              child: ListView.builder(
                itemCount: NumberListModal.numbers.length,
                itemBuilder: (context, index) {
                return ListTile(
                  title: Center(child: Text("${NumberListModal.numbers[index].toString()}")),
                );
              },),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: 
        () {
          NumberListModal.addNumbers();
        },child: Icon(Icons.add),),
    ),);
  }
}
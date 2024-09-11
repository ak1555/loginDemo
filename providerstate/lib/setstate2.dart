import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/providerstatee/numberlistprovider.dart';

class SetState2 extends StatefulWidget {
  const SetState2({super.key});

  @override
  State<SetState2> createState() => _SetState2State();
}

class _SetState2State extends State<SetState2> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<NumberListProvider>(
      builder: (context, NumberListModal, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Center(child: Text("SetState2"),),
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
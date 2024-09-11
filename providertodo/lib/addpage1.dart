import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage1 extends StatefulWidget {
  const AddPage1({super.key});

  @override
  State<AddPage1> createState() => _AddPage1State();
}

class _AddPage1State extends State<AddPage1> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) => Scaffold(
      body: Column(
        children: [
          Container(
            height: 55,
            width: 250,
            child: Expanded(child: TextField()),
          )
        ],
      ),
    ),);
  }
}
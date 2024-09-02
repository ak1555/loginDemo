import 'package:flutter/material.dart';

void main(){
  runApp(_StopWatch());
}
class _StopWatch extends StatefulWidget {
  const _StopWatch({super.key});

  @override
  State<_StopWatch> createState() => __StopWatchStateState();
}

class __StopWatchStateState extends State<_StopWatch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
        ),
      ),
    ); 
  }
}
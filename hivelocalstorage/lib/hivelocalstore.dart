import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveStore extends StatefulWidget {
  const HiveStore({super.key});

  @override
  State<HiveStore> createState() => _HiveStoreState();
}

class _HiveStoreState extends State<HiveStore> {

final _mybox=Hive.box('mybox');

void write(){
  _mybox.put(1, "flutter");
}

void read(){
  print(_mybox.get(1));
}

void delete(){
  _mybox.delete(1);
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hive Program"),),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(onPressed:write,
            child: Text("Write"),
            color: Colors.blue,),
            
              MaterialButton(
                onPressed:
                read,
            child: Text("Read"),
            color: Colors.green,),

              MaterialButton(onPressed:
              delete,
            child: Text("delete"),
            color: Colors.red,),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class TodoS extends ChangeNotifier{

  List<dynamic> todolist=[];
  
void addtodo(value){
todolist.add(value);
notifyListeners();
}


}
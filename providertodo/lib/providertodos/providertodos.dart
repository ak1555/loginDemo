import 'package:flutter/material.dart';

class TodoS extends ChangeNotifier{

  List<dynamic> todolist=[];
  
void addtodo(data){

todolist.add(data);
notifyListeners();
print(todolist);
}

void edit(data,s){
todolist[s]=data;
notifyListeners();
}

void delete(indexx){
todolist.removeAt(indexx);
notifyListeners();
}
}
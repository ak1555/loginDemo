import 'package:flutter/material.dart';

class TodoS extends ChangeNotifier{

  List<dynamic> todolist=[];
  
void addtodo(data){

todolist.add(data);
notifyListeners();
print(todolist);
}

void edit(indexx){

}

void delete(indexx){
todolist.removeAt(indexx);
notifyListeners();
}
}
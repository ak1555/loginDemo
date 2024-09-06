import 'package:flutter/material.dart';

class AnimatedListViewExmp extends StatefulWidget {
  const AnimatedListViewExmp({super.key});

  @override
  State<AnimatedListViewExmp> createState() => _AnimatedListViewExmpState();
}

class _AnimatedListViewExmpState extends State<AnimatedListViewExmp> {
  GlobalKey<AnimatedListState>_listkey=GlobalKey<AnimatedListState>();

List ls=[];
int count=0;

void add(){
  setState(() {
    ls.insert(0, "item${count++}");
    _listkey.currentState?.insertItem(0,duration: Duration(milliseconds: 350));
  });
  print(ls);
}
void delete(index){
  final String removeitem=ls.removeAt(index);
 _listkey.currentState?.removeItem(index, (context, animation) {
   return SizeTransition(sizeFactor: animation,
   axisAlignment: 0,
   child: ListTile(title: Text("removed.."),),);
   
 },duration: Duration(milliseconds: 350));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("AnimatedList"),),
        actions: [
          IconButton(onPressed:
          
              add
          , icon: Icon(Icons.add))
        ],
      ),
      body: AnimatedList(
        initialItemCount: ls.length,
        key: _listkey,
        itemBuilder: (context, index, animation) {
        return SizeTransition(sizeFactor: animation,
        child: ListTile(
          title: Text(ls[index]),
          trailing: IconButton(onPressed: () {
           delete(index);
          }, icon: Icon(Icons.delete)),
        ),
        );
      },),
    );
  }
}
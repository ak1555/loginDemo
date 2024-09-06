import 'package:flutter/material.dart';

class AnimatedGridviewExmp extends StatefulWidget {
  const AnimatedGridviewExmp({super.key});

  @override
  State<AnimatedGridviewExmp> createState() => _AnimatedGridviewExmpState();
}

class _AnimatedGridviewExmpState extends State<AnimatedGridviewExmp> {
GlobalKey<AnimatedGridState> _gridkey=GlobalKey<AnimatedGridState>();
List<int> ls=[];

void _insertItem(index){

  ls.insert(0, ls.length);
  _gridkey.currentState?.insertItem(index,duration: Duration(milliseconds: 350));

print(ls);
}

void deleteitem(index){
  ls.removeAt(index);
  _gridkey.currentState?.removeItem(index, (context, animation) {
    return ScaleTransition(scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
    child: Card(child: ListTile(title: Center(child: Text("Item Remove"),),),),);
  },duration: Duration(milliseconds: 450));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Animated GridView"),
        ),
        
      ),
      body: AnimatedGrid(
        key: _gridkey,
        itemBuilder: (context, index, animation) {
        return FadeTransition(opacity: animation,
        child: Card(
          shadowColor: Colors.cyan,
          elevation: 5,
          child: ListTile(
            title: Text(ls[index].toString()),
            trailing: IconButton(onPressed: () {
              deleteitem(index);
            }, icon: Icon(Icons.delete)),
          ),
        ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        _insertItem(ls.length);
      },child: Icon(Icons.add),),
    );
  }
}







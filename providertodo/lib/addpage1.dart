import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertodo/detailspage.dart';
import 'package:providertodo/providertodos/providertodos.dart';

class AddPage1 extends StatefulWidget {
  const AddPage1({super.key});

  @override
  State<AddPage1> createState() => _AddPage1State();
}

class _AddPage1State extends State<AddPage1> {
  TextEditingController _controller=TextEditingController();

  // void demo(){
  //    var data=_controller.text;
  //   // print(_controller.text.runtimeType);
  //   print(data.runtimeType);
  //   print(_controller.text);
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoS>(builder: (context, value, child) => Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueGrey[500],
        title: Center(child: Text("ADDPAGE",style: TextStyle(color: Colors.white),),),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(),));
          }, icon: Icon(Icons.arrow_forward,color: Colors.white,))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 25,),
          Container(
            height: 55,
            width: double.infinity,
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 55,
                  width: 230,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Expanded(child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Add....",
                      border: InputBorder.none),
                  )),
                ),
                TextButton(style: TextButton.styleFrom(
                  backgroundColor: Colors.limeAccent,
                  foregroundColor: Colors.red[800],
                  padding: EdgeInsets.fromLTRB(25, 19, 25, 19),
                  side: BorderSide(color: Colors.black,width: 1)
                ),
                  onPressed: () {
                  var data=_controller.text;
                  if(_controller.text!=""){
                     value.addtodo(data);
                     _controller.clear();
                  }else{
                    showDialog(context: context, builder: (context) {
                    return  AlertDialog(
                      title: Text("OOPS!!!!"),
                      content: Text("The Input Field Is Empty"),
                      actions: [TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text("OK"))],
                      );
                    },);
                  }
                // value.addtodo(data);
                }, child: Text("ADD",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),))
              ],
            ),
          ),
          SizedBox(height: 40,),

          Expanded(
            child: Container(
              height: 560,
              width: double.infinity,
              margin: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50)
              ),
              child: Expanded(child: 
              ListView.builder(itemCount: value.todolist.length,
                itemBuilder: (context, index) {
                return ListTile(
                  title: Center(child: Text("${value.todolist[index].toString()}",style: TextStyle(color: Colors.grey[600]),),),
                );
              },)),
            ),
          )
        ],
      ),
    ),);
  }
}
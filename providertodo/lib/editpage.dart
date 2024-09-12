import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertodo/providertodos/providertodos.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _controller = TextEditingController();
// int? s;

// @override
// void add(){
//   _controller=;
// }

//   void initState() {
//     // TODO: implement initState
//     super.initState();
// add();
//   }

  @override
  Widget build(BuildContext context) {
    int s= int.parse( ModalRoute.of(context)?.settings.arguments as String);




    return Consumer<TodoS>(builder: (context, value, child) => Scaffold(
      body:   Center(
        child: Container(
              height: 55,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 215,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Expanded(child: TextField(
                      controller: _controller=value.todolist[s],
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
      ),
    ),);
  }
}
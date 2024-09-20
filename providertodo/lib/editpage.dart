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
bool f = false;
List ls=[];
int? s;
  var  data;
// @override
void add(dataa){
  print(dataa);
  _controller.text=dataa;
}

void demo(){
  if(f==false){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Are You Sure"),
        content: Text("Are you want to EDIT"),
        actions: [TextButton(onPressed: () {
          add(data);
        }, child: Text("OK"))],
      );
    },);
  }
}

@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   demo();
  // //   add(data);
  // }
  @override
  Widget build(BuildContext context) {
    int s= int.parse( ModalRoute.of(context)?.settings.arguments as String);
      // data=ModalRoute.of(context)?.settings.arguments as String;



    return Consumer<TodoS>(builder: (context, value, child) => Scaffold(
      body:   Center(
        child: Container(
              // height: 55,
              height: 105,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Container(height: 10,width: 10,
                  // child: Expanded(child: ListView.builder(itemCount: ls.length,
                  //   itemBuilder: (context, index) {
                  //   return Text(ls[index].toString(),style: TextStyle(color: Colors.white),);
                  // },))
                  // ),
                   IconButton(onPressed: () {
                         var dataa=value.todolist[s];
                        add(dataa);
                      }, icon: Icon(Icons.refresh)),
                  Row(
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
                        onTap:() {
                           var dataa=value.todolist[s];
                        add(dataa);
                        },
                                  // controller: _controller=value.todolist[s],
                          controller: _controller,
                          
                          decoration: InputDecoration(
                            
                            hintText: "Tap to Edit",
                            border: InputBorder.none),
                        ),),
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
                           value.edit(data,s);
                           _controller.clear();
                          // add(dataa);
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
                      }, child: Text("ADD",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                  
                     
                    ],
                  ),
                ],
              ),
            ),
      ),
    ),);
  }
}
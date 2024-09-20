import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertodo/providertodos/providertodos.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}
class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoS>(builder: (context, value, child) => Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        title: Center(child: Container(
          height:45,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 185, 171, 172)
      ),
          child: Text(" Details ",style: TextStyle(),)),),
      ),
      body: 
      Container(height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey
      ),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Expanded(child: ListView.builder(
            itemCount: value.todolist.length,
            itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Menu..."),
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back))
                      ],
                    ),                    
                    content: Text("Choose from Options."),
                    actions: [
                      TextButton(onPressed: () {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>EditPage() ,));
                        Navigator.pushNamed(context, "/edit",arguments: index.toString());                         
                      }, child: Text("EDIT")),
                      TextButton(onPressed: () {
                        value.delete(index);
                        Navigator.pop(context);
                      }, child: Text("DELETE"))
                    ],
                  );
                },);
              },
              leading: Text(index.toString()),
              title: Center(child: Text(value.todolist[index].toString(),style: TextStyle(color: const Color.fromARGB(255, 97, 55, 55),
              fontSize: 20,),),),
              trailing: IconButton(onPressed: () {
                
              }, icon: Icon(Icons.more_vert,color: Colors.white,)),
            );
          },)),
        ],
      ),
      ),
    ),);
  }
}
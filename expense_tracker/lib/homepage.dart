import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
bool d_ontap= false;

void show(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),drawer: Drawer(backgroundColor: Colors.blue[200],
        child: Column(
          children: [

            SizedBox(height: 150,),
            // ========================================================= INCOME SECTION

                Container(
                  height: d_ontap ? 200 : 50,
                  child: TextButton(onPressed: () {
                                setState(() {
                                  d_ontap=true;
                                });
                              }, child:d_ontap? Container(
                                height: 200,
                                child: Card(
                                  child: Column(children: [
                                    SizedBox(height: 15,),
                                    Row(
                                      children: [
                                        SizedBox(width: 25,),
                                        Text("ENTER INCOME: "),
                                        Expanded(child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: 5),
                            enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(width: 1,color: const Color.fromARGB(255, 64, 2, 145)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1,color: Colors.redAccent),
                              borderRadius: BorderRadius.circular(15),
                              
                            )
                                          ),
                                        )),
                                         SizedBox(width: 15,),
                                      ],
                                    ),
                                    SizedBox(height: 65,),

                                    Row(children: [

                                       SizedBox(width: 105,),

                                           TextButton(
                                            style: TextButton.styleFrom(shape: BeveledRectangleBorder(
                                              borderRadius: BorderRadius.circular(0),side: BorderSide(width: .1)
                                            )),
                                            onPressed: () {
                                            setState(() {
                                              d_ontap=false;
                                            });
                                      },
                                       child: Text("CANCEL")),

                                          SizedBox(width: 15,),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                        shape: BeveledRectangleBorder(
                                          borderRadius: BorderRadius.circular(0),side: BorderSide(width: .1)
                                          )
                                        ),
                                        onPressed: () {
                                      }, 
                                      child: Text("OK"))
                                    ],)
                                  ],),
                                ),
                              ) : Text("INCOME")),
                ),

                SizedBox(height: 25,),
                // ==================================================== STATEMENT SECTION
            TextButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(

                );
              },);
            }, child: Text("STATEMENT")),
          ],
        )
      ),
      // =============================================================== BODY
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 0),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("INCOME:"),
                    Text("50000")
                  ],),

                   Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("EXPENSE:"),
                    Text("50000")
                  ],),

                  SizedBox(height: 50,),

                  Row(children: [
                    SizedBox(width: 350,),
                    Text("LEFT :"),
                    Text("500")
                  ],)


                ],
              ),
            )
          ],
        ),
      ),
      // =========================================================== FLOATINGACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blue[200],
            content: Card(
              // color: Colors.cyan[50],
             child: Container(
              height: 250,
              width: 300,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Text("NOTE:",style: TextStyle(fontSize: 12),),
                      SizedBox(width: 10,),

                      
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(width: 1,color: const Color.fromARGB(255, 64, 2, 145)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1,color: Colors.redAccent),
                              borderRadius: BorderRadius.circular(15),
                              
                            )
                          ),
                        )
                        ),
                    ],
                  ),),

                  SizedBox(height: 25,),

                     Container(
                    height: 40,
                    alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Text("EXPENSE:",style: TextStyle(fontSize: 12),),
                      SizedBox(width: 5,),

                      
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5),
                            enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(width: 1,color: const Color.fromARGB(255, 64, 2, 145)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1,color: Colors.redAccent),
                              borderRadius: BorderRadius.circular(15),
                              
                            )
                          ),
                        )
                        ),
                        SizedBox(width: 19,)
                    ],
                  ),),

                    SizedBox(height: 50,),
                    Row(children: [Text("BILL:"),
                    SizedBox(width: 140,),
                    Container(height: 50,width: 75,decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 64, 2, 145)),
                      borderRadius: BorderRadius.circular(5)
                    ),child: Icon(Icons.add_photo_alternate_outlined),)
                    ],)

                ],
              ),
              ),
              
            ),

            actions: [
              TextButton(onPressed: () {
                
              }, child: Text("Cancel")),
              SizedBox(width: 50,),
              TextButton(onPressed: () {
                
              }, child: Text("save"))
            ],
          );
        },);
      },child:  Icon(Icons.add,size: 35,),),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StateMent extends StatefulWidget {
  StateMent({super.key});

  @override
  State<StateMent> createState() => _StateMentState();
}

class _StateMentState extends State<StateMent> {
    TextEditingController note = TextEditingController();
  TextEditingController cash = TextEditingController();
    List <dynamic> expenselist = [];
  bool todatButton = true;
  bool monthButton = false;
  List items=[];
  List  leftincome=[0];
  final mybox=Hive.box('mybox');

void additem(){
  setState(() {
    items=mybox.get(2);
  });
  print(items);
}


void addexpense(){
  // print(items);
    List<Map<dynamic,dynamic>> demo=[];
var notes=note.text;
var expens= cash.text;

try{
  demo=mybox.get(2);
}catch(e){print(e);}

demo.add({
  "note":notes,
  "amount": expens
});
// demo.add(expenselist);
mybox.put(2, demo);
// print(expenselist);
}

void toleft(){
List one=[];
List three=[];
if(mybox.get(1)!=null){
  if(mybox.get(3)!=null){
    int a=int.parse(mybox.get(1));
     int b=int.parse(mybox.get(3));
     setState(() {
       leftincome[0]=a-b;
     });
  }
  else{
     setState(() {
       leftincome[0]=0;
     });
  }
}else{
  print("income null");
}

}



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    additem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 0, 51),
      //  Colors.lightBlueAccent[200],
      body: Container(
        child: Column(
          children: [
            // =============================================================== APPBAR
            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.microwave_rounded,
                    color: Colors.white,
                  ),
                  Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey[50]),
                      child: Icon(Icons.perm_identity_rounded))
                ],
              ),
            ),
            // ============================================================== MY BUDGET
            Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.only(left: 60),
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My budget:",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 23,
                          width: 18,
                          child: Image.asset(
                            "./images/rupee.jpg",
                            color: Colors.white,
                          )),
                      Text(
                        " 500",
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // ============================================================= LISTVIEW

            Container(
              height: 560,
              width: double.infinity,
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.white),
              child: Column(
                children: [
                  // ========================================================== BUTTONS
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      children: [
                        // -----------------textbutton 1
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.only(
                                    left: 55, right: 55, top: 10, bottom: 10),
                                backgroundColor: todatButton
                                    ? Colors.black
                                    : Colors.grey[200]),
                            onPressed: () {
                              setState(() {
                                monthButton = !monthButton;
                                todatButton = !todatButton;
                                additem();
                              });
                            },
                            child: Text(
                              "USED ",
                              style: TextStyle(
                                  color: todatButton
                                      ? Colors.white
                                      : Colors.deepPurpleAccent[800]),
                            )),
                              SizedBox(width: 2,),
                        // ----------text button 2
                        TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.only(
                                    left: 55, right: 55, top: 8, bottom: 8),
                                backgroundColor: monthButton
                                    ? Colors.black
                                    : Colors.grey[200]),
                            onPressed: () {
                              setState(() {
                                monthButton = !monthButton;
                                todatButton = !todatButton;
                                addexpense();
                                showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 4, 0, 51),
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
                               Container(
                                          height: 35,
                                          width: 70,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: .1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color.fromARGB(
                                                  255, 4, 0, 51)),
                                          child: Text(
                                            "NOTE:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.grey,
                                                      blurRadius: 5,
                                                      offset: Offset(2, 2))
                                                ]),
                                          )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: note,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 5),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 64, 2, 145)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.redAccent),
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                                Container(
                                          height: 35,
                                          width: 70,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: .1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color.fromARGB(
                                                  255, 4, 0, 51)),
                                          child: Text(
                                            "USD:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.grey,
                                                      blurRadius: 5,
                                                      offset: Offset(2, 2))
                                                ]),
                                          )),
                               SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: cash,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 5),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1,
                                          color:
                                              Color.fromARGB(255, 64, 2, 145)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.redAccent),
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              )),
                              const SizedBox(
                                width: 19,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                             Container(
                                          height: 35,
                                          width: 70,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: .1),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color.fromARGB(
                                                  255, 4, 0, 51)),
                                          child: Text(
                                            "BILL:",
                                            style: TextStyle(
                                                color: Colors.white,
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.grey,
                                                      blurRadius: 5,
                                                      offset: Offset(2, 2))
                                                ]),
                                          )),
                            const SizedBox(
                              width: 85,
                            ),
                            Container(
                              height: 50,
                              width: 75,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 64, 2, 145)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(
                                  Icons.add_photo_alternate_outlined),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                    foregroundColor: Colors.white
                    ),
                    onPressed: () {
                    // balance;
                    cash.clear();
                    note.clear();
                  }, child: const Text("Cancel")),
                  const SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                    foregroundColor: Colors.white
                    ),
                    onPressed: () {
                    addexpense();
                  }, child: const Text("save"))
                ],
              );
            },
          );
                              });
                            },
                            child: Text(
                              " ADD ",
                              style: TextStyle(
                                  color: monthButton
                                      ? Colors.white
                                      : Colors.deepPurpleAccent[800]),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      // color: Colors.amber,
                    //                             ======================================= LISTVIEW.BUILDER
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                       return Container(
                          height: 50,
                          width:double.infinity,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Row(children: [
                              Container(height: 30,
                              width: 30,
                              padding: EdgeInsets.all(7.5),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Image.asset("./images/rupee.jpg",fit: BoxFit.contain,),
                              ),
                              SizedBox(width: 25,),
                              Text(items[index]["note"].toString(),style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)
                            ],),
                    
                             Container(
                              width: 70,
                              alignment: Alignment.centerLeft,
                              child: Text(items[index]["amount"],style: TextStyle(
                                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red),))
                          ],),
                        );
                      },),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: () {
                              
                            }, icon: Icon(Icons.list_alt_outlined,color: Colors.white,)),
                           
                            IconButton(onPressed: () {
                            //  List l1=[0];
                            //  List l2=[0];
                            //  List l3=[0];
                            //  mybox.put(1, l1); 
                            //  mybox.put(2, l1); 
                            //  mybox.put(3, l1); 
                            }, icon: Icon(Icons.refresh,color: Colors.white,))
                        ],),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

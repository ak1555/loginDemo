import 'dart:async';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController note = TextEditingController();
  TextEditingController cash = TextEditingController();
  TextEditingController income = TextEditingController();
  // key 1=total income
  //  key 2 = expenses
  // key 3= balance amount

Timer? _timer;
  bool d_ontap = false;
  List ls =[0];
  List ls2=[0];
  List ls3=[0];
  List leftincome=[0];
  List items=[];
  int b=0;
  List <dynamic> expenselist = [];
  final mybox= Hive.box('mybox');

// ================================================== ADDINCOME
  void addincome(){
    // add income from the hive
    int lsincome=ls[0];
      String ii=income.text;
      int inputincome=int.parse(ii);
      int sum=inputincome+lsincome;
    setState(() {
      ls[0]=sum;
    });
    mybox.put(1, ls);
    print(ls[0]);
  }
  // ================================================= SHOW BALANCE

  void balance(){
   if(mybox.get(3)!=null){
    setState(() {
      ls3=mybox.get(3);
    });
   }else{
     setState(() {
      ls3[0]=0;
    });
   }
  }
// =================================================== PRINTINCOME
void printincome(){
  setState(() {
     if(mybox.get(1)!=null){
      List p=mybox.get(1);
        ls[0]=p[0];
  }
  else{
    print("Mybob 3 empty");
  }
  //   try{
  //    int p=mybox.get(3);
  //       ls2[0]=p;

  //   }catch(e){
  //     ls2[0]=0;
  //   }
 
  if(mybox.get(3)!=null){
      int p=mybox.get(3);
        ls2[0]=p;
  }
  else{
    print("Mybox 3 empty");
  }
   });
}
// ====================================================== ENTER EXPENSES
void addexpense(){
  List<dynamic> demo=[];
var notes=note.text;
var expens= cash.text;
var d= DateTime.now();
try{
  demo=mybox.get(2);
}catch(e){print(e);}

demo.add({
  "note":notes,
  "amount":expens.toString(),
});
mybox.put(2, demo);
print(demo);
// balance();
}
// ==================================================== LEFT
void toleft(){
  try{
List one=[0];
List<dynamic> three=[0];
if(mybox.get(1)!=null){
    List oone=mybox.get(1);
    List tthree=mybox.get(3);
    //  int a=int.parse(one[0]);
    //  int b=int.parse(three[0]);
      // b=int.parse(mybox.get(3));
    //  int x=a+b;
     setState(() {
      //  leftincome[0]=x;
     });

}else{
   leftincome[0]=0;
  print("income null");
}

  }catch(e){print(e);}

}
// ===========================SHOW
void show(){
if(mybox.get(2) !=null){
setState(() {
  items=mybox.get(2);
});
}
}





@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // printincome();
    balance();
    // toleft();
    show();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(backgroundColor:  Colors.amber[200],),
      drawer: Drawer(
        semanticLabel:String.fromCharCode(DateTime.daysPerWeek) ,
        surfaceTintColor: const Color.fromARGB(255, 224, 136, 136),
        clipBehavior: Clip.none,
          backgroundColor: const Color.fromARGB(255, 51, 62, 167),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              // ========================================================= INCOME SECTION

              SizedBox(
                height: d_ontap ? 200 : 50,
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        d_ontap = true;
                      });
                    },
                    child: d_ontap
                        ? SizedBox(
                            height: 200,
                            child: Card(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
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
                                            "INCOME:",
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
                                        controller:income,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 5),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 64, 2, 145)),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 1,
                                                  color: Colors.redAccent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                      )),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 55,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 95,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              shape: BeveledRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  side: const BorderSide(
                                                      width: .1,
                                                      color: Color.fromARGB(
                                                          255, 4, 0, 51)))),
                                          onPressed: () {
                                            cash.clear();
                                            setState(() {
                                              d_ontap = false;
                                            });
                                          },
                                          child: const Text("CANCEL")),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                              shape: BeveledRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  side: const BorderSide(
                                                      width: .1))),
                                          onPressed: () {
                                           
                                           
                                            setState(() {
                                              
                                               addincome();
                                              d_ontap = false;
                                               income.clear();
                                            });
                                            
                                          },
                                          child: const Text("OK")),
                                          SizedBox(width: 15,)
                                    ],
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            ),
                          )
                        : const Text("INCOME",style: TextStyle(color: Colors.white),)),
              ),

              const SizedBox(
                height: 25,
              ),
              // ==================================================== STATEMENT SECTION
              TextButton(
                  onPressed: () {
                    // showDialog(context: context, builder: (context) {
                    //   return const AlertDialog(

                    //   );
                    // },);
                    Navigator.pushNamed(context, "/statement");
                  },
                  child: const Text("STATEMENT",style: TextStyle(color: Colors.white))),
            ],
          )),
      // =============================================================== BODY
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 4, 0, 51),
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                   SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15,),
                      Text(
                        "INCOME:  ",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                       SizedBox(width: 25,),
                      Text(ls[0].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       SizedBox(width: 15,),
                      Text("EXPENSE:  ",
                          style: TextStyle(color: Colors.white, fontSize: 22)),
                           SizedBox(width: 25,),
                      Text(ls3[0].toString(),
                          style:
                              TextStyle(color: Colors.green[500], fontSize: 15))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 200,
                  //     ),
                  //     Text("LEFT :  ", style: TextStyle(color: Colors.white)),
                  //     Text(leftincome[0].toString(), style: TextStyle(color: Colors.red)),
                  //   ],
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  Spacer(),
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 150),
                    width: double.infinity,
                    // child: Image.asset(
                    //   "./images/blackexpenses.jpg",
                    //   fit: BoxFit.fill,
                    //   color: const Color.fromARGB(255, 4, 0, 51),
                    //   colorBlendMode: BlendMode.screen,
                    // ),
                    child:  Lottie.network(
                "https://lottie.host/5bfc0c45-686a-4591-b69c-d0826acea492/ydZQzn9w9L.json",
                fit: BoxFit.contain,width: double.infinity),
                  )
                ],
              ),
            ),
            //  Image.asset("./images/redexpense.jpg",fit: BoxFit.fill,),
            SizedBox(height: 8,),
           Container(
            height: 21.5,
            alignment: Alignment.topCenter,
            child: Text("RECENTS",style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold,fontSize: 20),),
           ),
            Container(
            height: 350,
            width: double.infinity,
            padding: EdgeInsets.only(left: 15,right: 15),
            // alignment: Alignment.bottomCenter,
            // color: Colors.black,
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
                              // Container(height: 30,
                              // width: 30,
                              // padding: EdgeInsets.all(7.5),
                              // decoration: BoxDecoration(
                              //   border: Border.all(),
                              //   color: Colors.grey[300],
                              //   borderRadius: BorderRadius.circular(100)
                              // ),
                              // child: Image.asset("./images/rupee.jpg",fit: BoxFit.contain,),
                              // ),
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
            )
          ],
        ),
      ),
      // =========================================================== FLOATINGACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color.fromARGB(255, 4, 0, 51),
        foregroundColor: Colors.white,
        onPressed: () {
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
                      
                    // balance();
                  

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
                      List sum=[];
                      List ls33=[];
                    int total=0;
                    if(mybox.get(2)!=null){
                      ls33=mybox.get(2);
                      int s=ls33.length;
                       for(int i=0;i<s;i++){
                        total+= int.parse(ls33[i]["amount"]);

                       }
                       List m=[0];
                       m[0]=total;
                       print(total);
                       mybox.put(3, m);
                      
                    }else{
                      print("no data in key2");
                    }
                    cash.clear();
                    note.clear();
                    balance();
                  }, child: const Text("save"))
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
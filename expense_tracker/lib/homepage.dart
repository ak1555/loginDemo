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

  bool d_ontap = false;
  List ls =[0];
  List ls2=[0];
  List ls3=[0];
  List leftincome=[0];
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
      ls3[0]=mybox.get(3);
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
    try{
      ls[0]=mybox.get(1);
    }catch(e){
      ls[0]=0;
    }
    try{
     int p=mybox.get(3);
        ls2[0]=p;

    }catch(e){
      ls2[0]=0;
    }
  });
}
// ====================================================== ENTER EXPENSES
void addexpense(){
  List<dynamic> demo=[];
var notes=note.text;
var expens= cash.text;
try{
  demo=mybox.get(2);
}catch(e){print(e);}

demo.add({
  "note":notes,
  "amount":expens.toString()
});
// demo.add(expenselist);
mybox.put(2, demo.toList());
print(demo);
}
// ==================================================== LEFT
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
    // printincome();
    balance();
    toleft();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 231, 231, 255),
      appBar: AppBar(),
      drawer: Drawer(
          backgroundColor: Colors.blue[200],
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
                        : const Text("INCOME")),
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
                  child: const Text("STATEMENT")),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "INCOME:  ",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                      Text(ls[0].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 19))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("EXPENSE:  ",
                          style: TextStyle(color: Colors.white, fontSize: 19)),
                      Text(ls3[0].toString(),
                          style:
                              TextStyle(color: Colors.green[500], fontSize: 15))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                      ),
                      Text("LEFT :  ", style: TextStyle(color: Colors.white)),
                      Text(leftincome[0].toString(), style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Spacer(),
                  Container(
                    height: 130,
                    padding: EdgeInsets.all(1),
                    width: double.infinity,
                    child: Image.asset(
                      "./images/blackexpenses.jpg",
                      fit: BoxFit.fill,
                      color: const Color.fromARGB(255, 4, 0, 51),
                      colorBlendMode: BlendMode.screen,
                    ),
                  )
                ],
              ),
            ),
            //  Image.asset("./images/redexpense.jpg",fit: BoxFit.fill,),
            Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Column(children: [
              // Lottie.network(
              //   "https://lottie.host/5bfc0c45-686a-4591-b69c-d0826acea492/ydZQzn9w9L.json",
              //   fit: BoxFit.contain,height: 310,width: double.infinity)
            ],),)
          ],
        ),
      ),
      // =========================================================== FLOATINGACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
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
                    int total=0;
                    if(mybox.get(2)!=null){
                      ls3=mybox.get(2);
                      int s=ls3.length;
                       for(int i=0;i<s;i++){
                        total+= int.parse(ls3[i]["amount"]);

                       }
                       print(total);
                       mybox.put(3, total);
                      
                    }else{
                      print("no data in key3");
                    }
                    cash.clear();
                    note.clear();
                    // balance();
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

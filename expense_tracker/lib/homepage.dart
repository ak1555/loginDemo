import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool d_ontap = false;

  TextEditingController note = TextEditingController();
  TextEditingController cash = TextEditingController();
  TextEditingController income = TextEditingController();

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
                                        controller: income,
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
                                    height: 65,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 105,
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
                                          onPressed: () {},
                                          child: const Text("OK"))
                                    ],
                                  )
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
              height: 300,
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
                      Text("50000",
                          style: TextStyle(color: Colors.white, fontSize: 19))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("EXPENSE:  ",
                          style: TextStyle(color: Colors.white, fontSize: 19)),
                      Text("49500",
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
                        width: 300,
                      ),
                      Text("LEFT :  ", style: TextStyle(color: Colors.white)),
                      Text("500", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
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
                              const Text(
                                "NOTE:",
                                style: TextStyle(fontSize: 12),
                              ),
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
                              const Text(
                                "use(in bracket):",
                                style: TextStyle(fontSize: 12),
                              ),
                              const SizedBox(
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
                            const Text("BILL:"),
                            const SizedBox(
                              width: 140,
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
                  TextButton(onPressed: () {}, child: const Text("Cancel")),
                  const SizedBox(
                    width: 50,
                  ),
                  TextButton(onPressed: () {}, child: const Text("save"))
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

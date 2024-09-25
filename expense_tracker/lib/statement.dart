import 'package:flutter/material.dart';

class StateMent extends StatefulWidget {
  StateMent({super.key});

  @override
  State<StateMent> createState() => _StateMentState();
}

class _StateMentState extends State<StateMent> {
  bool todatButton = true;
  bool monthButton = false;
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
                              });
                            },
                            child: Text(
                              "TODAY",
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
                              });
                            },
                            child: Text(
                              "MONTH",
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
                  Container(
                    height: 400,
                    width: double.infinity,
                    color: Colors.amber,
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
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

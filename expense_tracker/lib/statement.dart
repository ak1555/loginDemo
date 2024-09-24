import 'package:flutter/material.dart';

class StateMent extends StatefulWidget {
   StateMent({super.key});

  @override
  State<StateMent> createState() => _StateMentState();
}

class _StateMentState extends State<StateMent> {
  bool todatButton = true;
  bool monthButton =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: Container(
        child: Column(
          children: [
            // =============================================================== APPBAR
            Container(
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.microwave_rounded),
                  Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey[50]
                    ),
                    child:  Icon(Icons.perm_identity_rounded))
                ],
              ),
            ),
            // ============================================================== MY BUDGET
            Container(
              height: 150,
              width: double.infinity,
              padding:  EdgeInsets.only(left: 60),
              // color: Colors.red,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My budget:"),
                  Row(
                    children: [
                      Image.asset(""),
                      Text("RS:500"),
                    ],
                  )
                ],
              ),
            ),
            // ============================================================= LISTVIEW

            Container(
              height: 665,
              width: double.infinity,
              padding: EdgeInsets.only(top: 20,left: 15,right: 15),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))
                ,color: Colors.white
              ),
              child: Column(
                children: [
                  // ========================================================== BUTTONS
                  Container(
                    height:50 ,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Row(
                      children: [
                        // -----------------textbutton 1
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(left: 55,right: 55,top: 20,bottom: 20),
                            backgroundColor: todatButton ?Colors.black:Colors.grey[200]
                          ),
                          onPressed: () {
                         setState(() {
                           monthButton=!monthButton;
                           todatButton=!todatButton;
                         });
                        }, child: Text("TODAY",style: TextStyle(
                          color:  todatButton ?Colors.white:Colors.deepPurpleAccent[800]
                        ),)),

                        // ----------text button 2
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(left: 55,right: 55,top: 20,bottom: 20),
                            backgroundColor: monthButton ?Colors.black:Colors.grey[200]
                          ),
                          onPressed: () {
                          setState(() {
                            monthButton=!monthButton;
                             todatButton=!todatButton;
                          });
                        }, child: Text("MONTH",style: TextStyle(
                          color:  monthButton ?Colors.white:Colors.deepPurpleAccent[800]
                        ),))
                      ],
                    ),
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
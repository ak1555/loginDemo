import 'package:flutter/material.dart';

class StateMent extends StatefulWidget {
  const StateMent({super.key});

  @override
  State<StateMent> createState() => _StateMentState();
}

class _StateMentState extends State<StateMent> {
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
                  Icon(Icons.perm_identity_rounded)
                ],
              ),
            ),
            // ============================================================== MY BUDGET
            Container(
              height: 170,
              width: double.infinity,
              padding: EdgeInsets.only(right: 80),
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("MY BUDGET:"),
                  Text("RS:500")
                ],
              ),
            ),
            // ============================================================= LISTVIEW

            Container(
              height: 645,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(100))
                ,color: Colors.white
              ),
            )

          ],
        ),
      ),
    );
  }
}
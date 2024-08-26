import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
           height: MediaQuery.of(context).size.height,
         width: MediaQuery.of(context).size.width,
         padding: EdgeInsets.all(20),
         child: Column(mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              // color: Colors.amber,
                height: MediaQuery.of(context).size.height /3,
                width: double.infinity,
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(width: 250,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row( children: [
                      Text("NAME"),SizedBox(width: 10,),Text(":"),SizedBox(width: 10,),
                       Text("ABIN KRISHNA")],),
                      Row( children: [
                      Text("AGE"),SizedBox(width: 10,),Text(":"),SizedBox(width: 10,),
                       Text("54")],),
                          Row( children: [
                      Text("CLASS"),SizedBox(width: 10,),Text(":"),SizedBox(width: 10,),
                       Text("5346")],),
                  ],
                  ),
                  ),
                  Container(height: 200,
                    child: Icon(Icons.perm_identity_outlined,size: 150,)),
                ],),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 200,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Row( children: [
                      Text("ID"),SizedBox(width: 10,),Text(":"),SizedBox(width: 10,),
                       Text("5346")],),
                       Container(child:Column(children: [
                        Text("MARKS :"),
                           Row( children: [
                      Text("ENG"),SizedBox(width: 10,),Text(":"),SizedBox(width: 10,),
                       Text("46")],),
                          Row( children: [
                      Text("MAL"),SizedBox(width: 10,),Text(":"),SizedBox(width: 10,),
                       Text("53")],),
                          Row( children: [
                      Text("HIN"),SizedBox(width: 10,),Text(":"),SizedBox(width: 10,),
                       Text("53")],),
                       ],) ,)
              ],),
            )
          ],
         ),
      ),
      floatingActionButton: IconButton(
        style: IconButton.styleFrom(padding: EdgeInsets.all(15),iconSize: 30,
        backgroundColor: Colors.green,foregroundColor: Colors.white),
        onPressed: () {
        
      }, icon: Icon(Icons.edit)),
    );
  }
}
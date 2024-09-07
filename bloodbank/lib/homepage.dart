import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.black38,
        child: ListView(
          children: [
            Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 211, 12, 12),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))
                ),
            child: Center(child: Image.asset("./images/bld.jpeg",height: 300,),),
            ),
              SizedBox(height: 15,),
            Container(child: Center(child: Text("Pick Yourblood group",style: TextStyle(fontFamily: "olf"),))),
            SizedBox(height: 15,),
            // -------------------------------------------------------- row 1
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey,blurRadius: 10,spreadRadius: 0
                    )]
                  ),
                child: Card(
                   color: Colors.red[900],
                   child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900],
                   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10))
                   ),
                    onPressed: (){},
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("A+",style: TextStyle(color: Colors.white,fontSize: 22),),
                      SizedBox(width: 5,),
                      Icon(Icons.water_drop_outlined,color: Colors.white,size: 30,)],
                     ),
                   ),

                ),
                ),
                 Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey,blurRadius: 10,spreadRadius: 0
                    )]
                  ),
                child: Card(
                   color: Colors.red[900],
                   child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900],
                   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10))
                   ),
                    onPressed: (){},
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("A-",style: TextStyle(color: Colors.white,fontSize: 22),),
                      SizedBox(width: 5,),
                      Icon(Icons.water_drop_outlined,color: Colors.white,size: 30,)],
                     ),
                   ),

                ),
                )
              ],
            ),
            // ------------------------------------------------------------ row 1 ^
            SizedBox(height: 20,),
             // -------------------------------------------------------- row 2 v
           
         
            // ======================================================= row 3 v
          
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey,blurRadius: 10,spreadRadius: 0
                    )]
                  ),
                child: Card(
                   color: Colors.red[900],
                   child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900],
                   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10))
                   ),
                    onPressed: (){},
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("O+",style: TextStyle(color: Colors.white,fontSize: 22),),
                      SizedBox(width: 5,),
                      Icon(Icons.water_drop_outlined,color: Colors.white,size: 30,)],
                     ),
                   ),

                ),
                ),
                 Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.grey,blurRadius: 10,spreadRadius: 0
                    )]
                  ),
                child: Card(
                   color: Colors.red[900],
                   child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900],
                   shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10))
                   ),
                    onPressed: (){},
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("O-",style: TextStyle(color: Colors.white,fontSize: 22),),
                      SizedBox(width: 5,),
                      Icon(Icons.water_drop_outlined,color: Colors.white,size: 30,)],
                     ),
                   ),

                ),
                )
              ],
            ),
              // -------------------------------------------------------- row 3 ^
                   SizedBox(height: 30,),
                   Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(onTap: () {
                          
                        },
                          child: Text("Search for your Group",style: TextStyle(
                            color: Colors.white,fontSize: 20),)
                            ),

                        IconButton(onPressed: () {
                          
                        }, icon: Icon(Icons.menu,size: 33,color: Colors.white,))
                      ],
                    ),
                   )
           
              
            
          ],
        ),
      ) ,
    );
  }
}
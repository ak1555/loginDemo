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
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100,),
          color: Colors.grey[400]),
          child: Icon(Icons.perm_identity_sharp,size: 35,),
        )],
        title: Center(child: Text("DETAILS")),
        leading: IconButton(onPressed: () {
          
        }, icon: Icon(Icons.arrow_back)),
      ),
      
      body: Container(
        height: double.infinity,
        width: double.infinity,
       
        child: Column(
          children: [

            Container(
              height: 65,
              width: double.infinity,
              color: Colors.red,
              child: Container(
                height: 40,
                width: double.infinity,
                 margin: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                 padding: EdgeInsets.only(left: 15),
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white
                 ),
                child: Row(
                  children: [
                    Icon(Icons.search),SizedBox(width: 10,),
                    Text("SEARCH......")
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              height: 50,
              width: double.infinity,
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 50,width: 50,decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.circular(8)
                  ),child: Center(child: Text("A+",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "edu"),),),),
                    Container(height: 50,width: 50,decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.circular(8)
                  ),child: Center(child: Text("O+",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "edu"),),),),
                    Container(height: 50,width: 50,decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.circular(8)
                  ),child: Center(child: Text("B+",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "edu"),),),),
                    Container(height: 50,width: 50,decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.circular(8)
                  ),child: Center(child: Text("AB+",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "edu"),),),),
                    Container(height: 50,width: 50,decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.circular(8)
                  ),child: Center(child: Text("A-",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "edu"),),),),
                    Container(height: 50,width: 50,decoration: BoxDecoration(
                    color: Colors.red,borderRadius: BorderRadius.circular(8)
                  ),child: Center(child: Text("AB-",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "edu"),),),),
                ],
              ),
            ),
            // ListView.builder(itemCount: 10,
            //   itemBuilder: (context, index) {
              
            // },
            // )
          ],
        ),
      ),
      
    );
  }
}
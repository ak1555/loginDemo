import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(padding: EdgeInsets.fromLTRB(55, 25, 55, 25),
        child: ListView(
          children: [
        
            Center(
              child: Container(
                height: 150,
                width: 150,
                alignment: Alignment.center,
                child: ClipOval(
                  child:  Text("no image")),
              ),
            ),
        
            Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Fname",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                SizedBox(height: 2),
                Expanded(flex: 0, child: TextField(
                  //  controller:c2,
                   keyboardType: TextInputType.name,
                   decoration: InputDecoration(
                  labelText: "FirstName",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                ),)
              ],),),
                
                Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Lname",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                SizedBox(height: 2),
                Expanded(flex: 0, child: TextField(
                  keyboardType: TextInputType.name,
                  //  controller:c2,
                   decoration: InputDecoration(
                  labelText: "LastName",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                ),)
              ],),),

              Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Email",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                SizedBox(height: 2),
                Expanded(flex: 0, child: TextField(
                  //  controller:c2,
                  keyboardType: TextInputType.emailAddress,
                   decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                ),)
              ],),),

               Container(
              width: 350,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Number",style: TextStyle(fontWeight: FontWeight.w500,letterSpacing: 1),),
                SizedBox(height: 2),
                Expanded(flex: 0, child: TextField(
                  //  controller:c2,
                   keyboardType: TextInputType.name,
                   decoration: InputDecoration(
                  labelText: "PhoneNumber",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 5)))
                ),)
              ],),),
                SizedBox(height: 25,),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(35, 25, 35, 25),
                    backgroundColor: Color.fromARGB(255, 0, 17, 0),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                  
                }, child: Text("ADD")),
              )
                
          ],
        ),
      ),
    );
  }
}
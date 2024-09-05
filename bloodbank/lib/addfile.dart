import 'package:flutter/material.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.cyan,
        child:ListView(
          children: [
            Container(
              height: 220,
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  // =========================================stack start
                    Stack(
                    clipBehavior: Clip.none,
                    children: [
                             Container(
                    height: 110,
                    width: double.infinity,
                   decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadiusDirectional.vertical(bottom: Radius.circular(100))
                   ),child: ClipRRect(borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                    child: Image.asset("./images/redimg.jpeg",fit: BoxFit.fill,)),
                  ),

                      Positioned(top: 40,left: 110,
                        child:Container(height: 140,width: 140,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: const Color.fromARGB(255, 46, 44, 44)),)),
                      
                    ],
                  ),
                  // =========================================stack end

                 
                
                ],
              ),
            ),
            // ================================================ padding containers start
             Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Name"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(15),),
                    child: Expanded(child: Expanded(child: TextField(
                       keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "FullName",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                  // ---------------------------------- fullname ^
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Email"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(15),),
                    child: Expanded(child: Expanded(child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                  // ---------------------------------- email ^
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Phone"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(15),),
                    child: Expanded(child: Expanded(child: TextField(
                       keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "ContactNumber",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                   // ---------------------------------- contact number ^
                    Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Place"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(15),),
                    child: Expanded(child: Expanded(child: TextField(
                       keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Place,District",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                   // ---------------------------------- place ^
                    Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Date of Birth"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(15),),
                    child: Expanded(child: Expanded(child: TextField(
                       keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "dd-mm-yyyy",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),
                    // ---------------------------------- DOB ^
                      Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Blood Group"),
                  ),
                   Container(
                    height: 50,
                    // width: double.infinity,
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.only(left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(border: Border.all(),
                    borderRadius: BorderRadius.circular(15),),
                    child: Expanded(child: Expanded(child: TextField(
                       keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "sjj",
                        border: InputBorder.none,
                        hoverColor: Colors.red
                      ),
                    ))),
                  ),

                    // ================================================ padding containers end
          ],
        )
      ),
    );
  }
}
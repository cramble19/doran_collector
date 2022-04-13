import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class MainScreen extends StatefulWidget {


 static String id='main_screen';


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? dropdownvalue1='Cramble';
  @override
  // void initState() {
  //   dropdownvalue1=widget.loggedinUser;
  //   super.initState();
  // }

int? temp=0;
  String? dropdownvalue2='Cramble';
  String? betAmount='100';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
@override

  Widget _buildListItem(BuildContext context, DocumentSnapshot doc){
    return Padding(
      padding: doc['name']=='Cramble'?EdgeInsets.fromLTRB(8.0, 25.0, 8.0, 8.0): EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
        tileColor: Color(0xFFf0c3f7),
        title: Row(
          children: [
            Expanded(child: Text(doc['name'],style: TextStyle(
              color: Colors.purple[700],
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),),),
            Container(child: Text(doc['dorans'].toString(),style: TextStyle(
              color: Colors.purpleAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),),)
          ],
        ),

      ),
    );
  }

    Future<void> updateDorans1()async {

      var collection = FirebaseFirestore.instance.collection('users');
      var docSnapshot = await collection.doc('$dropdownvalue1').get();
      if (docSnapshot.exists) {
        Map<String, dynamic>? data = docSnapshot.data();
        int user1value = data?['dorans']; // <-- The value you want to retrieve.
        return users
            .doc('$dropdownvalue1')
            .update({'dorans':user1value -int.parse(betAmount!)})
            .then((value) => print("User Updated"))
            .catchError((error) => print("Failed to update user: $error"));
      }


    }
  Future<void> updateDorans2()async {

    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc('$dropdownvalue2').get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      int user2value = data?['dorans']; // <-- The value you want to retrieve.
      return users
          .doc('$dropdownvalue2')
          .update({'dorans':user2value +int.parse(betAmount!)})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }


  }


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;
    temp==0?dropdownvalue1=args:null;
    return Scaffold(
      backgroundColor: Color(0xFFfbe5ff),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //       showModalBottomSheet(
      //           context: context,
      //           builder:(BuildContext context){
      //             return Container();
      //           });
      //   },
      //   child: CircleAvatar(
      //     radius: 27.0,
      //   backgroundImage: AssetImage('assets/doran_icon.png',)),
      //   backgroundColor: Colors.white12,
      // ),
      appBar: AppBar(
        backgroundColor: Color(0xFF2C0233),
        title: Text('Bank of Doran'),
      ),
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('users').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  return ListView.builder(
                  itemCount: 3,
                      itemBuilder: (context,index)=>_buildListItem(context,snapshot.data!.docs[index]));


                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0,left: 5.0),
              child: Container(
                child: Row(
                  children: [
                    Text('From: '), SizedBox(width: 5.0,),
                 DropdownButton<String>(
    value: dropdownvalue1,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style:  TextStyle(color: Colors.deepPurple),
    underline: Container(
    height: 2,
    color: Colors.deepPurpleAccent,
    ),
    onChanged: (String? newValue) {
    setState(() {
    dropdownvalue1 = newValue!;
    temp=-1;
    });
    },
    items: <String>['Cramble','Dragon','Kratos']
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    ),
                    SizedBox(width: 5.0,),
                    Text('To: '), SizedBox(width: 5.0,),
                    DropdownButton<String>(
                      value: dropdownvalue2,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style:  TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue2 = newValue!;
                        });
                      },
                      items: <String>['Cramble','Dragon','Kratos']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ), SizedBox(width: 5.0,),Text('of: '), SizedBox(width: 5.0,),

                DropdownButton<String>(
                  value: betAmount,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style:  TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      betAmount = newValue!;
                    });
                  },
                  items: <String>['100','500','1000','3000','5000','10000','20000','50000']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
             SizedBox(width: 5.0,), GestureDetector(
    onTap:()async{
      await updateDorans1();
      await updateDorans2();
    },
    child: Container(

    margin: const EdgeInsets.only(top: 3.0,bottom: 3.0),
    padding: const EdgeInsets.only(top: 3.0,bottom: 3.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
    color: Color(0xFFfbe5ff),
    border: Border.all(color: Colors.deepPurple,width: 2.0)
    ),
    child: Text('Dorans',
    style: TextStyle(

        backgroundColor: Color(0xFFfbe5ff),
    ),
    ),
    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// class Tile extends StatelessWidget {
//   String name;
//   int dorans;
//   Tile({required this.name,required this.dorans})
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// Container(
// child: Column(
// children: [
// SizedBox(height: 30.0,),
// // Padding(
// //   padding: const EdgeInsets.only(top: 15.0,bottom: 10.0),
// //   child: Row(
// //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //     children: [
// //       Text('Name1',
// //       style: TextStyle(
// //         fontSize: 30.0,
// //         fontWeight: FontWeight.bold,
// //         letterSpacing: 2.0,
// //       ),),
// //       SizedBox(width: 40.0,),
// //       Text('0',
// //         style: TextStyle(
// //           fontSize: 30.0,
// //           fontWeight: FontWeight.bold,
// //           letterSpacing: 2.0,
// //         ),)
// //     ],
// //   ),
// //
// // ),
// // SizedBox(height: 20.0,),
// //
// //
// //
// // Padding(
// //   padding: const EdgeInsets.only(top: 15.0,bottom: 10.0),
// //   child: Row(
// //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //     children: [
// //       Text('Name2',
// //         style: TextStyle(
// //           fontSize: 30.0,
// //           fontWeight: FontWeight.bold,
// //           letterSpacing: 2.0,
// //         ),),
// //       SizedBox(width: 40.0,),
// //       Text('0',
// //         style: TextStyle(
// //           fontSize: 30.0,
// //           fontWeight: FontWeight.bold,
// //           letterSpacing: 2.0,
// //         ),)
// //     ],
// //   ),
// //
// // ),
// // SizedBox(height: 20.0,),
// //
// //
// //
// // Padding(
// //   padding: const EdgeInsets.only(top: 15.0,bottom: 10.0),
// //   child: Row(
// //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //     children: [
// //       Text('Name3',
// //         style: TextStyle(
// //           fontSize: 30.0,
// //           fontWeight: FontWeight.bold,
// //           letterSpacing: 2.0,
// //         ),),
// //       SizedBox(width: 40.0,),
// //       Text('0',
// //         style: TextStyle(
// //           fontSize: 30.0,
// //           fontWeight: FontWeight.bold,
// //           letterSpacing: 2.0,
// //         ),)
// //     ],
// //   ),
// //
// // ),
// SizedBox(height: 20.0,),
// ],
// ),
// ),


import 'package:doran_collector/Screens/MainScreen.dart';
import 'package:doran_collector/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class LoginScreen extends StatefulWidget {
  String id='login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

String? loginvalue='Cramble';
String? userId;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0,),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.0,),
            child: Hero(
              tag: 'doran_logo',
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Colors.purple[900],
                  radius:83,
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/doran_icon.png',
                      // width: w*0.8,
                      //   height: h*0.4,
                    ),
                  ),
                ),
              ),
            ),
          ),
                SizedBox(height: 40.0,),
                // TextField(
                //   onChanged: (login){
                //         userId=login;
                //         // print(userId);
                //   },
                //
                //   decoration: InputDecoration(
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.white,)
                //     ),
                //     labelText: 'Login ID',
                //     hintStyle: TextStyle(
                //       color: Colors.black,
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //     )
                //   ),
                //
                // ),
                DropdownButton<String>(
                  value: loginvalue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style:  TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      loginvalue = newValue!;
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



                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(200, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                      elevation: 2.0,
                      backgroundColor: Colors.purple[900],
                    ),
                    onPressed: (){

                      Navigator.pushNamed(context, MainScreen.id,arguments: loginvalue);
                    },
                    child: Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),),),
                ),
                // TextField(
                //   onChanged: (password){
                //
                //   },
                //
                //   decoration: InputDecoration(
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white,)
                //       ),
                //       labelText: 'Login ID',
                //       hintStyle: TextStyle(
                //         color: Colors.black,
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //       )
                //   ),
                //
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

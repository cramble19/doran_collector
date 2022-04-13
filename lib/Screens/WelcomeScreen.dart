import 'package:doran_collector/Screens/LoginScreen.dart';
import 'package:doran_collector/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
 String id ='welcome_screen';


  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.0,),
                  child: Hero(
                    tag: 'doran_logo',
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.purple[900],
                        radius: 140,
                        child: CircleAvatar(
                          radius: 130.0,
                          backgroundImage: AssetImage('assets/doran_icon.png',
                          // width: w*0.8,
                          //   height: h*0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                      Navigator.pushNamed(context, LoginScreen().id);
                    },
                    child: Text('Login',
                      style: TextStyle(
                      color: Colors.white,
                    ),),),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: TextButton(
                //
                //     style: TextButton.styleFrom(
                //       minimumSize: Size(200, 45),
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                //       elevation: 2.0,
                //       backgroundColor: Colors.purple[900],
                //     ),
                //     onPressed: (){
                //       Navigator.pushNamed(context, RegisterScreen().id);
                //     }, child: Text('Register',
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

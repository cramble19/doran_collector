import 'package:doran_collector/Screens/LoginScreen.dart';
import 'package:doran_collector/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:doran_collector/Screens/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    // theme: ThemeData.dark(),
    initialRoute: WelcomeScreen().id,
    routes: {
      WelcomeScreen().id: (context) => WelcomeScreen(),
      LoginScreen().id: (context)=> LoginScreen(),
      MainScreen.id: (context)=> MainScreen(),
    },
  ));
}

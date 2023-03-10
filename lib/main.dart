import 'package:flutter/material.dart';
import 'get_start.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      //routes:{},
      debugShowCheckedModeBanner: false,
      title: 'Welcome To Our App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:   OnBoardingScreen(),
    );
  }
}


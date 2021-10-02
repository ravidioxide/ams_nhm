import 'package:ams_nhm/Dashboard.dart';
import 'package:ams_nhm/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:ams_nhm/Splash.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Splash()
    );
  }
}


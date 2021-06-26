import 'package:webapp/home_page.dart';
import 'package:webapp/services/Custom-Pc/custom_pc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechNEXI',
      debugShowCheckedModeBanner: false,
      home: HomePage(), //SysytemServices(), // //
    );
  }
}

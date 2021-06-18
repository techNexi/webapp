import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:webapp/services/custom_pc.dart';
import 'package:webapp/services/system_service.dart';
import 'package:webapp/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home_page.dart';

bool isMorning() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return true;
  } else {
    return false;
  }
}

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: EasyDynamicThemeWidget(
        initialThemeMode: isMorning() ? ThemeMode.light : ThemeMode.dark,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /* Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }*/

  @override
  void initState() {
    // getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechNEXI',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      debugShowCheckedModeBanner: false,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: PcCustom(), // HomePage(), //SysytemServices(), // //
    );
  }
}

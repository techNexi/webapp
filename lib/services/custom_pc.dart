import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webapp/home_page.dart';
import 'package:webapp/misc/blink_button.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/theme.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class PcCustom extends StatefulWidget {
  const PcCustom({Key key}) : super(key: key);

  @override
  _PcCustomState createState() => _PcCustomState();
}

class _PcCustomState extends State<PcCustom> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var colorizeColors = [
    Colors.greenAccent,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  showAlertDialog(BuildContext context, String title, body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      // endDrawer: PCAppDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(width / 2, 600),
        child: Container(
          width: width / 1.7,
          color: Theme.of(context).bottomAppBarColor.withOpacity(0.8),
          child: Padding(
            padding: EdgeInsets.only(left: 0, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Image.asset("assets/images/logo.png",
                          width: width / 5),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      },
                    ),
                    Text(
                      "CUSTOM PC BUILDS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? 16
                              : width * 0.02,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      /*AppBar(
        brightness: Brightness.dark,
        leading: Row(
          children: [
            TextButton(
              child: Image.asset("assets/images/logo.png", width: width / 5),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
            ),
            Text(
              "CUSTOM BUILD PCS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: ResponsiveWidget.isSmallScreen(context)
                      ? 16
                      : width * 0.01,
                  fontFamily: fontFamily2,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        foregroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),*/
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                image: AssetImage(
                    "assets/images/service/pc-customization/pc-bg.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.14,
                    ),
                    Container(
                      width: width,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "GET PC CUSTOMIZED FOR - ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveWidget.isSmallScreen(context)
                                  ? 35
                                  : width * 0.033,
                              fontFamily: fontFamily2,
                            ),
                          ),
                          Container(
                            height: height * 0.4,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 45
                                          : width * 0.055,
                                  letterSpacing: 1,
                                  fontFamily: fontFamily2,
                                  fontWeight: FontWeight.bold),
                              child: Padding(
                                padding: EdgeInsets.only(top: height * 0.1),
                                child: AnimatedTextKit(
                                    pause: const Duration(milliseconds: 1000),
                                    isRepeatingAnimation: true,
                                    repeatForever: true,
                                    animatedTexts: [
                                      RotateAnimatedText(
                                        '\nGAMING',
                                        // speed: const Duration(milliseconds: 200),
                                      ),
                                      RotateAnimatedText(
                                        '\nOFFICE',
                                        //   speed: const Duration(milliseconds: 200),
                                      ),
                                      RotateAnimatedText(
                                        '\nWORK FROM HOME',
                                        //  speed: const Duration(milliseconds: 200),
                                      ),
                                      RotateAnimatedText(
                                        '\nPROFESSION',
                                        //  speed: const Duration(milliseconds: 200),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.16,
                    ),
                    Container(
                      //   color: Colors.purple[900].withOpacity(0.2),
                      width: width,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.03125,
                              left: width * 0.0725,
                              bottom: height * 0.03125,
                              right: width * 0.0725),
                          child: Column(
                            children: [
                              AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    "Buying a pc is overrated nowadays. At TechNEXI, we understand the importance of building the perfect PC. To cater to that, we offer the most extensive range of components and specifications on the system build market. Our collection of custom PC’s, Gaming setups all are customizable to suit your unique preferences, whilst maintaining an expert level of value and quality, regardless of budget.",
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: fontFamily2,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.015),
                                    colors: colorizeColors,
                                    // speed: Duration(milliseconds: 600)
                                  ),
                                ],
                                totalRepeatCount: 500000,
                                repeatForever: true,
                                isRepeatingAnimation: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///////////
                  ],
                ),
                Container(
                    width: width * 0.045,
                    color: Colors.white12,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyBlinkingButton(
                              child: IconButton(
                            color: Colors.white,
                            icon: Icon(
                              Icons.menu,
                            ),
                            iconSize: 33,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    elevation: 16,
                                    child: Container(
                                      color: Colors.black87,
                                      height: height,
                                      width: width,
                                      child: ListView(
                                        children: <Widget>[
                                          SizedBox(height: 20),
                                          Center(
                                            child: Text(
                                              "MENU",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Text("App drawer Content 1 +"),
                                          Text("App drawer Content 2 +"),
                                          Text("App drawer Content 3 +"),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  color: Colors.white,
                                  iconSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 30
                                          : width * 0.02,
                                  icon: Icon(Icons.phone),
                                  onPressed: () {
                                    launch("tel://+919353771544");
                                    showAlertDialog(context, "Call or Whatsapp",
                                        "Please reach out at +919353771544");
                                  }),
                              IconButton(
                                color: Colors.white,
                                iconSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 30
                                        : width * 0.02,
                                icon: Icon(Icons.email),
                                onPressed: () async {
                                  final mailtoLink = Mailto(
                                    to: ['technexi.india@gmail.com'],
                                    // cc: ['cc1@example.com', 'cc2@example.com'],
                                    body: 'Hi TechNEXI, I need to service my ',
                                    subject: 'Service Request',
                                  );
                                  // Convert the Mailto instance into a string.
                                  // Use either Dart's string interpolation
                                  // or the toString() method.
                                  await launch('$mailtoLink');
                                },
                              ),
                              IconButton(
                                color: Colors.white,
                                iconSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 30
                                        : width * 0.02,
                                // Use the MdiIcons class for the IconData
                                icon: new Icon(MdiIcons.whatsapp),
                                onPressed: () async {
                                  final link = WhatsAppUnilink(
                                    phoneNumber: "+919353771544",
                                    text:
                                        "Hello TechNEXI! I want to service my PC.",
                                  );
                                  await canLaunch("$link")
                                      ? launch('$link')
                                      : showAlertDialog(context, "Error",
                                          "Unable to launch whatsapp, Please write to technexi.india@gmail.com");
                                },
                              ),
                              IconButton(
                                  color: Colors.white,
                                  iconSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 30
                                          : width * 0.02,
                                  icon: new Icon(MdiIcons.instagram),
                                  onPressed: () {
                                    launch(
                                        'https://www.instagram.com/technexi/');
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PCAppDrawer extends StatelessWidget {
  const PCAppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: height * 0.03125,
            left: width * 0.0625,
            bottom: height * 0.03125,
            right: width * 0.0625),
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

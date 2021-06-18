import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/theme.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PcCustom extends StatefulWidget {
  const PcCustom({Key key}) : super(key: key);

  @override
  _PcCustomState createState() => _PcCustomState();
}

class _PcCustomState extends State<PcCustom> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      drawerScrimColor: Colors.red,
      endDrawer: PCAppDrawer(),
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              Text(
                "PC CUSTOMIZATION",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2,
                    fontSize: ResponsiveWidget.isSmallScreen(context)
                        ? 30
                        : width * 0.03,
                    fontFamily: fontFamily2,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                width: width,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "GET CUSTOMIZED PC FOR - ",
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
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 45
                                : width * 0.055,
                            letterSpacing: 1,
                            fontFamily: fontFamily2,
                            fontWeight: FontWeight.bold),
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 0.059),
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
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                width: width,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.03125,
                        left: width * 0.0725,
                        bottom: height * 0.03125,
                        right: width * 0.0725),
                    child: Text(
                      "Buying a pc is overrated nowadays. At TechNEXI, we understand the importance of building the perfect PC. To cater to that, we offer the most extensive range of components and specifications on the system build market. Our collection of custom PC’s, Gaming setups all are customizable to suit your unique preferences, whilst maintaining an expert level of value and quality, regardless of budget.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.w600,
                          fontFamily: fontFamily2,
                          fontSize: ResponsiveWidget.isSmallScreen(context)
                              ? 16
                              : width * 0.015),
                    ),
                  ),
                ),
              )
            ],
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
            children: [
              Text("App drawer Content 1 +"),
              Text("App drawer Content 2 +"),
              Text("App drawer Content 3 +"),
            ],
          ),
        ),
      ),
    );
  }
}

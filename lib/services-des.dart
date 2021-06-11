import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webapp/drawer_small.dart';
import 'package:webapp/nav_bar.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/theme.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:webapp/web_scrollbar.dart';

class ServicesDesc extends StatefulWidget {
  const ServicesDesc({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ServicesDescState createState() => _ServicesDescState();
}

class _ServicesDescState extends State<ServicesDesc> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  final List<Map<String, String>> body = [
    {
      'App Development':
          'TechNEXI provides specialized and advanced application development services. We create intriguing apps with the captivative interfaces and wide range features. We develop apps according to your requirements for a reasonable price.'
    },
    {'System Services': 'assets/images/services.jpg'},
    {'Web Development': 'assets/images/web.jpg'},
    {'PC Customization': 'assets/images/custom.jpg'},
    {'Flutter Development': 'assets/images/flutter.jpg'},
    {'Projects & Courses': 'assets/images/arduino.jpg'},
    {'Smartphone Services': 'assets/images/mobile.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    EasyDynamicTheme.of(context).changeTheme();
                  },
                ),
              ],
              title: Text(
                'TechNEXI',
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 600),
              child: TopBarContents(_opacity),
            ),
      drawer: WebappDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          // physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height / 5),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text("${widget.title}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: ResponsiveWidget.isSmallScreen(context)
                            ? 40
                            : width * 0.07,
                        fontFamily: fontFamily2,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: width * 0.1),
                      child: Text(
                        "TechNEXI provides specialized and advanced application development services. We create intriguing apps with the captivative interfaces and wide range features. We develop apps according to your requirements for a reasonable price. ",
                        style: TextStyle(
                            fontFamily: fontfamily,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 14
                                : width * 0.016),
                      ),
                    ),
                  ),
                  // Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  Container(
                      width: width / 3,
                      child: Image.asset("assets/images/app-dev1.png")),
                  //  SizedBox(height: height * 0.08),
                  //   ],
                  //  )
                ],
              ),
              Container(
                  width: width,
                  height: height * 0.6,
                  color: Colors.pink[100],
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: width / 3,
                            child: Image.asset("assets/images/app-dev2.png")),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: width * 0.1),
                            child: Text(
                              "TechNEXI provides specialized and advanced application development services. We create intriguing apps with the captivative interfaces and wide range features. We develop apps according to your requirements for a reasonable price. ",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: fontfamily,
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 14
                                          : width * 0.016),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                width: width,
                height: height * 0.8,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

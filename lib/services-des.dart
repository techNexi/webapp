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

  final Map<String, String> servicesBody = {
    'App Development':
        'TechNEXI provides specialized and advanced application development services. We create intriguing apps with the captivative interfaces and wide range features. We develop apps according to your requirements for a reasonable price.',
    'System Services':
        'PC or laptop running any version needs frequent maintenance. Here at TechNEXI, We provide enhanced support services for your computer — for Windows and Mac. We perform both online and onfield services. Speak to a friendly technical expert today! No-cost consultation call. ',
    'Web Development':
        'Smart solutions are the essence of Website Development. All our codes are hand coded by our expert developers. We develop User friendly Websites by adapting to the recent trends and create customs according to your requirements.',
    'PC Customization':
        'At TechNEXI, we understand the importance of building the perfect PC. To cater to that, we offer the most extensive range of components and specifications on the system build market. Our collection of custom PCs, gaming computers, and laptops are all customisable to suit your unique preferences, whilst maintaining an excellent level of value and quality, regardless of budget',
    'Flutter Development':
        'As a one of the most preferred Android and iOS app development company, TexhNEXI offers next gen app development services using Google’s revolutionary framework, Flutter. Hiring our Flutter app development services helps you get multi-platform applications with seamless animations, appealing UI, and excellent performance.',
    'Projects & Courses':
        'TexhNEXI is the one of the most preferred project development company. We provide best in class career oriented & Advanced Final year project for any branches of Enginering students, We provide trainings for all development ,research, courses and personality development, final year projects training skills across the world',
    'Smartphone Services':
        'TechNEXI provides an extraordinary servicing experience to the various customers, steered by the highest standard of competence and service excellence.',
  };

  final Map<String, Color> servicesColor = {
    'App Development': Colors.pink,
    'System Services': Color(0xFF2196F3),
    'Web Development': Color(0xFF009688),
    'PC Customization': Color(0xFFFF9800),
    'Flutter Development': Color(0xFF2196F3),
    'Projects & Courses': Color(0xFF4CAF50),
    'Smartphone Services': Color(0xFFFFED3d),
  };
  final Map<String, Image> servicesImage1 = {
    'App Development': Image.asset("assets/images/app-dev1.png"),
    'System Services': Image.asset(""),
    'Web Development': Image.asset(""),
    'PC Customization': Image.asset(""),
    'Flutter Development': Image.asset(""),
    'Projects & Courses': Image.asset(""),
    'Smartphone Services': Image.asset(""),
  };
  final Map<String, Image> servicesImage2 = {
    'App Development': Image.asset("assets/images/app-dev2.png"),
    'System Services': Image.asset(""),
    'Web Development': Image.asset(""),
    'PC Customization': Image.asset(""),
    'Flutter Development': Image.asset(""),
    'Projects & Courses': Image.asset(""),
    'Smartphone Services': Image.asset(""),
  };
  final Map<String, Image> servicesImage3 = {
    'App Development': Image.asset("assets/images/app-dev3.png"),
    'System Services': Image.asset(""),
    'Web Development': Image.asset(""),
    'PC Customization': Image.asset(""),
    'Flutter Development': Image.asset(""),
    'Projects & Courses': Image.asset(""),
    'Smartphone Services': Image.asset(""),
  };

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
                        servicesBody[widget.title],
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
                      width: width / 3, child: servicesImage1[widget.title]),
                  //  SizedBox(height: height * 0.08),
                  //   ],
                  //  )
                ],
              ),
              Container(
                color: Colors.white,
                child: Container(
                    width: width,
                    height: height * 0.6,
                    color: servicesColor[widget.title].withAlpha(100),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: width / 3,
                              child: servicesImage2[widget.title]),
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
              ),
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

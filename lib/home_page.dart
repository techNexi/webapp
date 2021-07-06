import 'dart:ui';

import 'package:webapp/misc/hover.dart';
import 'package:webapp/theme.dart';
import 'package:webapp/web_scrollbar.dart';
import 'package:webapp/drawer_small.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    _opacity =
        _scrollPosition < height * 0.40 ? _scrollPosition / (height * 0.40) : 1;

    return Scaffold(
      backgroundColor: myBlack4,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              iconTheme: IconThemeData(color: myWhite3),
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: _opacity,
              centerTitle: true,
              title: Text(
                'TechNEXI',
                style: TextStyle(
                  color: myWhite1,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(width, 600),
              child: TopBarContents(_opacity),
            ),
      drawer: WebappDrawer(),
      body: WebScrollbar(
        color: Colors.grey,
        backgroundColor: myWhite3,
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                  height: ResponsiveWidget.isSmallScreen(context)
                      ? height * 0.17
                      : height * 0.23),
              Text(
                "SERVICE  BEYOND\nCOMPROMISE".toLowerCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: myWhite3,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 35 : 80,
                  fontFamily: fontFamily2,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(height: height * 0.2),
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Who We Are'.toLowerCase(),
                          style: TextStyle(
                            color: myWhite3,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 20
                                : 55,
                            fontFamily: fontFamily2,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          '\nfrom bold ideas to successful digital products via creating future-ready apps, websites and digital solutions. We also provide expertised Tech solutions and services.',
                          style: TextStyle(
                            color: myWhite3.withOpacity(0.7),
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 10
                                : 15,
                            fontFamily: fontFamily1a,
                            fontWeight: ResponsiveWidget.isSmallScreen(context)
                                ? FontWeight.w100
                                : FontWeight.w100,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: height * 0.16),
                        Text(
                          'Services we offer'.toLowerCase(),
                          style: TextStyle(
                            color: myWhite3,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 20
                                : 55,
                            fontFamily: fontFamily2,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          '\nwe have a wide range of tech and software services that an entrepreneurship needs.',
                          style: TextStyle(
                            color: myWhite3.withOpacity(0.7),
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 10
                                : 15,
                            fontFamily: fontFamily1a,
                            fontWeight: ResponsiveWidget.isSmallScreen(context)
                                ? FontWeight.w100
                                : FontWeight.w100,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height / 6),
              Padding(
                padding: EdgeInsets.only(left: width / 10.0, right: width / 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: height * 0.1),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            gradient: new LinearGradient(
                                colors: [Colors.greenAccent, myBlack4],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          width: width / 3,
                          height: height / 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(38.0),
                            child: HoverImage(
                              child: Image.asset(
                                "assets/images/service/mob.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.1),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            gradient: new LinearGradient(
                                colors: [Color(0x55fefefe), myBlack4],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          width: width / 3,
                          height: height / 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(38.0),
                            child: HoverImage(
                              child: Image.asset(
                                "assets/images/service/mac.png",
                                width: width / 50,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.1),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            gradient: new LinearGradient(
                                colors: [Color(0xff6fa8ab), myBlack4],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          width: width / 3,
                          height: height / 1.5,
                          child: HoverImage(
                            child: Image.asset(
                              "assets/images/service/cpu.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            gradient: new LinearGradient(
                                colors: [Color(0xffdc3f73), myBlack4],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          width: width / 3,
                          height: height / 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(38.0),
                            child: HoverImage(
                              child: Image.asset(
                                "assets/images/service/mob.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.1),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            gradient: new LinearGradient(
                                colors: [Colors.lime, myBlack4],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          width: width / 3,
                          height: height / 1.5,
                          child: Padding(
                            padding: const EdgeInsets.all(38.0),
                            child: HoverImage(
                              child: Image.asset(
                                "assets/images/service/mac.png",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.1),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            gradient: new LinearGradient(
                                colors: [Colors.red, myBlack4],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          width: width / 3,
                          height: height / 1.5,
                          child: HoverImage(
                            child: Image.asset(
                              "assets/images/service/cpu.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(height: height)
            ],
          ),
        ),
      ),
    );
  }
}



/*Stack(
                children: [
                  Container(
                    color: Colors.black,
                    child: SizedBox(
                      height: screenSize.height * 0.55,
                      width: screenSize.width,
                      child: Theme.of(context).brightness == Brightness.dark
                          ? Image.asset(
                              'assets/images/bg-dark.jpg',
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/bg-light.jpg',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: screenSize.height / 3.8),
                      Padding(
                        padding: EdgeInsets.only(
                          // top: screenSize.height * 0.00,
                          left: screenSize.width / 15,
                          right: screenSize.width / 15,
                        ),
                        child: ResponsiveWidget.isSmallScreen(context)
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'SERVICE BEYOND COMPROMISE .',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'SERVICE BEYOND COMPROMISE .',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(height: screenSize.height / 4),
                      //  FloatingQuickAccessBar(screenSize: screenSize),

                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                'About Us',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 20
                                          : 32,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: screenSize.height / 180),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenSize.width * 0.115,
                                  right: screenSize.width * 0.115,
                                  top: 15),
                              child: Text(
                                // Our team, at TechNEXI are well-verse of expertise in a variety of tech development and services.\n
                                'We provide basic to advance development and services in software and hardware domains such as Web development, App development, Website design, Flutter development, System services, Mobile Services, Hardware customization and Project development, and so on. We provide your requirements at affordable range.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1
                                      .color,
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 14
                                          : 17,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            ResponsiveWidget.isSmallScreen(context)
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: screenSize.height / 50),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: screenSize.width / 15),
                                          ...Iterable<int>.generate(
                                                  assets.length)
                                              .map(
                                            (int pageIndex) => Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: screenSize.width /
                                                          2.5,
                                                      width: screenSize.width /
                                                          1.5,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        child: Image.asset(
                                                          assets[pageIndex],
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        top: screenSize.height /
                                                            70,
                                                      ),
                                                      child: Text(
                                                        title[pageIndex],
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryTextTheme
                                                              .subtitle1
                                                              .color,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    width:
                                                        screenSize.width / 15),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: screenSize.height * 0.06,
                                      left: screenSize.width / 15,
                                      right: screenSize.width / 15,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ...Iterable<int>.generate(assets.length)
                                            .map(
                                          (int pageIndex) => Column(
                                            children: [
                                              SizedBox(
                                                height: screenSize.width / 6,
                                                width: screenSize.width / 3.8,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: Image.asset(
                                                    assets[pageIndex],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: screenSize.height / 70,
                                                ),
                                                child: Text(
                                                  title[pageIndex],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .primaryTextTheme
                                                        .subtitle1
                                                        .color,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              ServicesHeading(screenSize: screenSize),
              ServicesItem(),
              SizedBox(height: screenSize.height / 10),
              BottomBar(), */
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:webapp/web_scrollbar.dart';
import 'package:webapp/bottom_bar.dart';
import 'package:webapp/servics.dart';
import 'package:webapp/drawer_small.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/nav_bar.dart';
import 'package:flutter/material.dart';

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

  final List<String> assets = [
    'assets/images/3.png',
    'assets/images/1.png',
    'assets/images/4.png',
  ];

  final List<String> title = [
    'DEVELOP',
    'KNOWLEDGE',
    'SERVICE',
  ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

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
                  icon: Theme.of(context).brightness == Brightness.light
                      ? Icon(Icons.brightness_2_outlined)
                      : Icon(Icons.brightness_6),
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
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
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
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

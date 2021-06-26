import 'package:webapp/theme.dart';
import 'package:webapp/web_scrollbar.dart';
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
      backgroundColor: myWhite1,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              iconTheme: IconThemeData(color: myBlack3),
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: _opacity,
              centerTitle: true,
              title: Text(
                'TechNEXI',
                style: TextStyle(
                  color: myBlack3,
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
        backgroundColor: myWhite1,
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
                "SERVICE  BEYOND  COMPROMISE",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: myBlack2,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 22 : 38,
                  fontFamily: 'Montserrat',
                  fontWeight: ResponsiveWidget.isSmallScreen(context)
                      ? FontWeight.w600
                      : FontWeight.w800,
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
                          'ABOUT US\n',
                          style: TextStyle(
                            color: myBlack1,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 18
                                : 32,
                            fontFamily: fontFamily2,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          'from bold ideas to successful digital products via creating future-ready apps, websites and digital solutions. We also provide expertised Tech solutions and services.',
                          style: TextStyle(
                            color: myBlack2,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
                                ? 13
                                : 20,
                            fontWeight: ResponsiveWidget.isSmallScreen(context)
                                ? FontWeight.w300
                                : FontWeight.w400,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
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
import 'package:flutter/material.dart';
import 'package:webapp/bottom_bar.dart';
import 'package:webapp/services_page.dart';
import 'dart:ui';
import 'package:webapp/drawer_small.dart';
import 'package:webapp/nav_bar.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/theme.dart';
import 'package:webapp/web_scrollbar.dart';
import 'package:webapp/services/Custom-Pc/scrolling_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class SysytemServices extends StatefulWidget {
  const SysytemServices({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SysytemServicesState createState() => _SysytemServicesState();
}

class _SysytemServicesState extends State<SysytemServices> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  showAlertDialog(BuildContext context, String title, body) {
    // set up the button

    // show the dialog
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
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              // physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                /* color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.blueGrey[900]
                    : Colors.grey[300],*/
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      Theme.of(context).brightness == Brightness.dark
                          ? "assets/images/service/system-service/bg-black.jpg"
                          : "assets/images/service/system-service/bg-yellow.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenSize.height / 6),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            bottom: ResponsiveWidget.isSmallScreen(context)
                                ? 25
                                : 45,
                          ),
                          child: Text("${widget.title}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 40
                                          : width * 0.05,
                                  fontFamily: fontFamily2,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.125,
                              right: width * 0.125,
                              top: 20,
                              bottom: 40),
                          child: Center(
                            child: Text(
                              "System service is practice of keeping computer in good state of repair. PC or laptop running any version needs frequent maintenance and updating.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fontFamily,
                                  fontSize:
                                      ResponsiveWidget.isSmallScreen(context)
                                          ? 16
                                          : width * 0.016),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.03,
                              right: width * 0.03,
                              top: height * 0.09,
                              bottom: height * 0.15),
                          child: PhysicalModel(
                            color: Colors.transparent,
                            elevation: 25,
                            shadowColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: ResponsiveWidget.isSmallScreen(context)
                                  ? height * 0.35
                                  : height * 0.6,
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: width / 3,
                                        child: Image.asset(
                                            "assets/images/service/ss-2.png")),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.05,
                                            right: width * 0.05),
                                        child: Text(
                                          "It is frustrating to have malfunctioning system when you need it most. Not to worry, at TechNEXI, we have qualified specialist capable of undertaking your PC’s repair in a professional and efficient manner with assured guarantee for any kind of laptop or PC. ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black87,
                                              fontFamily: fontFamily,
                                              fontSize: ResponsiveWidget
                                                      .isSmallScreen(context)
                                                  ? 16
                                                  : width * 0.016),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.03,
                          top: height * 0.07,
                          bottom: height * 0.08),
                      child: PhysicalModel(
                        color: Colors.transparent,
                        elevation: 25,
                        shadowColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: width * 0.7,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.03,
                                right: width * 0.01,
                                top: height * 0.07,
                                bottom: height * 0.01),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'We Offer our Assistance on:\n\n',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontFamily: fontFamily,
                                      fontSize: ResponsiveWidget.isSmallScreen(
                                              context)
                                          ? 16
                                          : width * 0.026),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Free first online basic service.\n',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Online PC repair and resolutioning OS issues.\n',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Replacement of Hardware parts.\n',
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Removal of Virus and threat file from system.\n',
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Computer troubleshooting for slow PC and laptop speed.\n',
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Installation and configuration of other computer connected devices.\n',
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Installation and uninstallation of various software applications.\n',
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Installation and set-up of hardware drivers  for best system performance.\n',
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'On Field engineer support for PC and laptop in Bangalore region.\n',
                                    style: TextStyle(
                                        fontFamily: fontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 14
                                                : width * 0.017),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: width,
                      height: height * 0.15,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height * 0.08),
                        child: Container(
                          color: Colors.white30,
                          child: ScrollingText(
                            text:
                                "Get Expertised System Services from 249/- onwards.      For queries call on +91 9353771544        ",
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 15
                                        : width * 0.019),
                          ),
                        ),
                      ),
                    ),
                    BottomBar(),
                  ],
                ),
              ),
            ),
            Container(
              //  height: height / 2,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[700]
                  : Colors.white70,
              width:
                  ResponsiveWidget.isSmallScreen(context) ? 50 : width * 0.05,
              child: Padding(
                padding: EdgeInsets.all(width * 0.005),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          color: Colors.black,
                          iconSize: ResponsiveWidget.isSmallScreen(context)
                              ? 30
                              : width * 0.03,
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            launch("tel://+919353771544");
                            showAlertDialog(context, "Call or Whatsapp",
                                "Please reach out at +919353771544");
                          }),
                      IconButton(
                        color: Colors.black,
                        iconSize: ResponsiveWidget.isSmallScreen(context)
                            ? 30
                            : width * 0.03,
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
                        color: Colors.black,
                        iconSize: ResponsiveWidget.isSmallScreen(context)
                            ? 30
                            : width * 0.03,
                        // Use the MdiIcons class for the IconData
                        icon: new Icon(MdiIcons.whatsapp),
                        onPressed: () async {
                          final link = WhatsAppUnilink(
                            phoneNumber: "+919353771544",
                            text: "Hello TechNEXI! I want to service my PC.",
                          );
                          await canLaunch("$link")
                              ? launch('$link')
                              : showAlertDialog(context, "Error",
                                  "Unable to launch whatsapp, Please write to technexi.india@gmail.com");
                        },
                      ),
                      IconButton(
                          color: Colors.black,
                          iconSize: ResponsiveWidget.isSmallScreen(context)
                              ? 30
                              : width * 0.03,
                          icon: new Icon(MdiIcons.instagram),
                          onPressed: () {
                            launch('https://www.instagram.com/technexi/');
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

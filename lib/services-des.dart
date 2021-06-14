import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webapp/drawer_small.dart';
import 'package:webapp/nav_bar.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/theme.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:webapp/web_scrollbar.dart';
import 'package:webapp/services_page.dart';

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
          // physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height / 5),
              ServicesPage(
                title: widget.title,
              ),
              Container(
                  color: Colors.black45, height: height * 0.8, width: width)
            ],
          ),
        ),
      ),
    );
  }
}

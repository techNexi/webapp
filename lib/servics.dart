/*import 'package:webapp/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:webapp/services-des.dart';
import 'package:webapp/services/Custom-Pc/custom_pc.dart';
import 'package:webapp/services/System-Services/system_service.dart';

class ServicesHeading extends StatelessWidget {
  const ServicesHeading({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 20,
              bottom: screenSize.height / 20,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Text(
              'OUR SERVICES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 10,
              bottom: screenSize.height / 15,
            ),
            width: screenSize.width,
            // color: Colors.black,
            child: Text(
              'OUR SERVICES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}

class ServicesItem extends StatefulWidget {
  @override
  _ServicesItemState createState() => _ServicesItemState();
}

class _ServicesItemState extends State<ServicesItem> {
 // final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  routeToContent(BuildContext context, String service) {
    switch (service) {
      case "App Development":
        //  Navigator.push(context,
        //  MaterialPageRoute(builder: (_) => ServicesDesc(title: service)));
        break;
      case "System Services":
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => SysytemServices(title: service)));
        break;
      case "Web Development":
        //   Navigator.push(context,
        //     MaterialPageRoute(builder: (_) => ServicesDesc(title: service)));
        break;
      case "PC Customization":
        Navigator.push(context, MaterialPageRoute(builder: (_) => PcCustom()));
        break;
      case "Projects & Courses":
        // Navigator.push(context,
        //   MaterialPageRoute(builder: (_) => ServicesDesc(title: service)));
        break;
      case "Smartphone Services":
        //  Navigator.push(context,
        //  MaterialPageRoute(builder: (_) => ServicesDesc(title: service)));
        break;
    }
  }

  final List<String> images = [
    'assets/images/hello.jpg',
    'assets/images/services.jpg',
    'assets/images/web.jpg',
    'assets/images/custom.jpg',
    'assets/images/flutter.jpg',
    'assets/images/arduino.jpg',
    'assets/images/mobile.jpg',
  ];

  final List<String> services = [
    'App Development',
    'System Services',
    'Web Development',
    'PC Customization',
    'Flutter Development',
    'Projects & Courses',
    'Smartphone Services',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    /*return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                  scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                      ? PageScrollPhysics()
                      : NeverScrollableScrollPhysics(),
                  enlargeCenterPage: true,
                  aspectRatio: 18 / 8,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                      for (int i = 0; i < imageSliders.length; i++) {
                        if (i == index) {
                          _isSelected[i] = true;
                        } else {
                          _isSelected[i] = false;
                        }
                      }
                    });
                  }),
              carouselController: _controller,
            ),
            GestureDetector(
              onTap: () {
                routeToContent(context, services[_current]);
              },
              child: AspectRatio(
                aspectRatio: 18 / 8,
                child: Center(
                  child: Text(
                    services[_current],
                    style: TextStyle(
                      letterSpacing: 6,
                      fontFamily: 'Electrolize',
                      fontSize: screenSize.width / 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : Center(
                heightFactor: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenSize.width / 8,
                      right: screenSize.width / 8,
                    ),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 150,
                          bottom: screenSize.height / 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < services.length; i++)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onHover: (value) {
                                      setState(() {
                                        value
                                            ? _isHovering[i] = true
                                            : _isHovering[i] = false;
                                      });
                                    },
                                    onTap: () {
                                      _controller.animateToPage(i);
                                      Future.delayed(
                                          Duration(milliseconds: 500), () {
                                        routeToContent(context, services[i]);
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: screenSize.width / 200,
                                          right: screenSize.width / 200,
                                          top: screenSize.height / 80,
                                          bottom: screenSize.height / 90),
                                      child: Text(
                                        services[i],
                                        style: TextStyle(
                                          fontSize: (screenSize.height *
                                                  screenSize.width) /
                                              90000,
                                          color: _isHovering[i]
                                              ? Theme.of(context)
                                                  .primaryTextTheme
                                                  .button
                                                  .decorationColor
                                              : Theme.of(context)
                                                  .primaryTextTheme
                                                  .button
                                                  .color,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    maintainSize: true,
                                    maintainAnimation: true,
                                    maintainState: true,
                                    visible: _isSelected[i],
                                    child: AnimatedOpacity(
                                      duration: Duration(milliseconds: 100),
                                      opacity: _isSelected[i] ? 1 : 0,
                                      child: Container(
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        width: screenSize.width / 10,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}*/*/

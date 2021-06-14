import 'package:flutter/material.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/services-des.dart';
import 'package:webapp/theme.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
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
    'App Development': Colors.pink[100],
    'System Services': Colors.blue[100],
    'Web Development': Colors.teal[100],
    'PC Customization': Colors.orange[100],
    'Flutter Development': Colors.blue[100],
    'Projects & Courses': Colors.green[200],
    'Smartphone Services': Colors.yellow[100],
  };
  final Map<String, Image> servicesImage1 = {
    'App Development': Image.asset("assets/images/service/app-dev1.png"),
    'System Services': Image.asset("assets/images/service/ss-1.png"),
    'Web Development': Image.asset("assets/images/service/web-1.png"),
    'PC Customization': Image.asset("assets/images/service/pc-1.png"),
    'Flutter Development': Image.asset("assets/images/service/flutter-1.png"),
    'Projects & Courses': Image.asset("assets/images/service/project-1.png"),
    'Smartphone Services': Image.asset("assets/images/service/ms-1.png"),
  };
  final Map<String, Image> servicesImage2 = {
    'App Development': Image.asset("assets/images/service/app-dev2.png"),
    'System Services': Image.asset("assets/images/service/ss-2.png"),
    'Web Development': Image.asset("assets/images/service/web-2.png"),
    'PC Customization': Image.asset("assets/images/service/pc-2.png"),
    'Flutter Development': Image.asset("assets/images/service/flutter-2.png"),
    'Projects & Courses': Image.asset("assets/images/service/project-2.png"),
    'Smartphone Services': Image.asset("assets/images/service/ms-2.png"),
  };
  final Map<String, Image> servicesImage3 = {
    'App Development': Image.asset("assets/images/service/app-dev3.png"),
    'System Services': Image.asset("assets/images/service/ss-3.png"),
    'Web Development': Image.asset("assets/images/service/web-3.png"),
    'PC Customization': Image.asset("assets/images/service/pc-3.png"),
    'Flutter Development': Image.asset("assets/images/service/flutter-3.png"),
    'Projects & Courses': Image.asset("assets/images/service/project-3.png"),
    'Smartphone Services': Image.asset("assets/images/service/ms-3.png"),
  };

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            Container(
              width: width / 3,
              child: servicesImage1[widget.title],
            ),
          ],
        ),
        Container(
            width: width,
            height: height * 0.6,
            color: servicesColor[widget.title],
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: width / 3, child: servicesImage2[widget.title]),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: width * 0.1),
                      child: Text(
                        "TechNEXI provides specialized and advanced application development services. We create intriguing apps with the captivative interfaces and wide range features. We develop apps according to your requirements for a reasonable price. ",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: fontfamily,
                            fontSize: ResponsiveWidget.isSmallScreen(context)
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
    );
  }
}

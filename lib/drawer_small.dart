import 'package:flutter/material.dart';
import 'package:webapp/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

class WebappDrawer extends StatefulWidget {
  const WebappDrawer({
    Key key,
  }) : super(key: key);

  @override
  WebappDrawerState createState() => WebappDrawerState();
}

class WebappDrawerState extends State<WebappDrawer> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  showAlertDialog(BuildContext context, String title, body) {
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

  showCallOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: myWhite2.withOpacity(0.8),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  launch("tel://+918892525859");
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w600)),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(Icons.call, color: myBlack3, size: 20),
                    SizedBox(width: 5),
                    new Text('Call for Software Dev & Courses',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w400,
                            color: myBlack3)),
                  ],
                ),
              ),
              SizedBox(height: 7),
              new ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  launch("tel://+919353771544");
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w600)),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(Icons.call, color: myBlack3, size: 20),
                    SizedBox(width: 5),
                    new Text('Call for Tech Services & Projects',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w400,
                            color: myBlack3)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  showWhatsappOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: myWhite2.withOpacity(0.8),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  final link = WhatsAppUnilink(
                    phoneNumber: "+918892525859",
                    text:
                        "Hello TechNEXI! I want to know more about Software development packages and Courses",
                  );
                  await canLaunch("$link")
                      ? launch('$link')
                      : showAlertDialog(context, "Error",
                          "Unable to launch whatsapp, Please write to technexi.india@gmail.com");
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w600)),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(MdiIcons.whatsapp, color: myBlack3, size: 20),
                    SizedBox(width: 5),
                    new Text('Whatapp for Software Dev & Courses',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w400,
                            color: myBlack3)),
                  ],
                ),
              ),
              SizedBox(height: 7),
              new ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  final link = WhatsAppUnilink(
                    phoneNumber: "+919353771544",
                    text:
                        "Hello TechNEXI! I want to know more about Services, Projects and Packages offered by you",
                  );
                  await canLaunch("$link")
                      ? launch('$link')
                      : showAlertDialog(context, "Error",
                          "Unable to launch whatsapp, Please write to technexi.india@gmail.com");
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w600)),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(MdiIcons.whatsapp, color: myBlack3, size: 20),
                    SizedBox(width: 5),
                    new Text('Whatsapp for Tech Services & Projects',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w400,
                            color: myBlack3)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: myWhite1,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    color: myBlack3.withOpacity(0.7),
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: Navigator.of(context).pop,
                  ),
                ],
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  print("hj");
                },
                onHover: (value) {
                  setState(() {
                    _isHovering[4] = value;
                  });
                },
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w400,
                    color: _isHovering[4] ? Colors.grey[600] : Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Divider(
                  color: myBlack3.withOpacity(0.15),
                  thickness: 2,
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[0] = value;
                  });
                },
                onTap: () {
                  Navigator.of(context).pop();
                  print("hj");
                },
                child: Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w400,
                    color: _isHovering[0] ? Colors.grey[600] : Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Divider(
                  color: myBlack3.withOpacity(0.15),
                  thickness: 2,
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[1] = value;
                  });
                },
                onTap: () {},
                child: Text(
                  'TechWiki',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w400,
                    color: _isHovering[1] ? Colors.grey[600] : Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Divider(
                  color: myBlack3.withOpacity(0.15),
                  thickness: 2,
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[2] = value;
                  });
                },
                onTap: () {},
                child: Text(
                  'Let\'s Talk Business',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w400,
                    color: _isHovering[2] ? Colors.grey[600] : Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Divider(
                  color: myBlack3.withOpacity(0.15),
                  thickness: 2,
                ),
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[3] = value;
                  });
                },
                onTap: () {},
                child: Text(
                  'Affiliates',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w400,
                    color: _isHovering[3] ? Colors.grey[600] : Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Divider(
                  color: myBlack3.withOpacity(0.15),
                  thickness: 2,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            color: myBlack3,
                            iconSize: 23,
                            icon: Icon(Icons.phone),
                            onPressed: () {
                              Navigator.of(context).pop();
                              showCallOption(context);
                            },
                          ),
                          IconButton(
                            color: myBlack3,
                            iconSize: 23,
                            icon: Icon(Icons.email),
                            onPressed: () async {
                              Navigator.of(context).pop();

                              final mailtoLink = Mailto(
                                to: ['technexi.india@gmail.com'],
                                cc: [
                                  'dshetty804@gmail.com',
                                  'shivara666@gmail.com'
                                ],
                                body: 'Hi TechNEXI, ',
                                subject: 'Redireted From Web',
                              );
                              // Convert the Mailto instance into a string.
                              // Use either Dart's string interpolation
                              // or the toString() method.
                              await launch('$mailtoLink');
                            },
                          ),
                          IconButton(
                            color: myBlack3,
                            iconSize: 23,
                            // Use the MdiIcons class for the IconData
                            icon: new Icon(MdiIcons.whatsapp),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              showWhatsappOption(context);
                            },
                          ),
                          IconButton(
                              color: myBlack3,
                              iconSize: 23,
                              icon: new Icon(MdiIcons.instagram),
                              onPressed: () {
                                Navigator.of(context).pop();
                                launch('https://www.instagram.com/technexi/');
                              }),
                        ],
                      ),
                      Text(
                        'Copyright © 2021 | TechNexi',
                        style: TextStyle(
                          color: myBlack3.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
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

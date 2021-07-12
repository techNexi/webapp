import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:webapp/home_page.dart';
import 'package:webapp/techWiki/techwiki.dart';
import 'package:webapp/theme.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 500),
      child: Container(
        decoration: BoxDecoration(
          color: myBlack1.withOpacity(0.9),
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: Image.asset("assets/images/logo.png", width: 180),
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: screenSize.width / 8),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[3] = true
                              : _isHovering[3] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'About Us',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: fontFamily1,
                              fontWeight: FontWeight.w400,
                              color:
                                  _isHovering[3] ? Colors.grey[600] : myWhite2,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[3],
                            child: Container(
                              height: 2,
                              width: 25,
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: fontFamily1,
                              fontWeight: FontWeight.w400,
                              color:
                                  _isHovering[0] ? Colors.grey[600] : myWhite2,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 25,
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[1] = true
                              : _isHovering[1] = false;
                        });
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TechWiki()),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "TechWiki",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: fontFamily1,
                              fontWeight: FontWeight.w400,
                              color:
                                  _isHovering[1] ? Colors.grey[600] : myWhite2,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 25,
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[2] = true
                              : _isHovering[2] = false;
                        });
                      },
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Let's Talk Business",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: fontFamily1,
                              fontWeight: FontWeight.w400,
                              color:
                                  _isHovering[2] ? Colors.grey[600] : myWhite2,
                            ),
                          ),
                          SizedBox(height: 5),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[2],
                            child: Container(
                              height: 2,
                              width: 25,
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                  ],
                ),
              ),

              /* InkWell(
                  onHover: (value) {
                    setState(() {
                      value ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: userEmail == null
                      ? () {
                          showDialog(
                            context: context,
                            builder: (context) => AuthDialog(),
                          );
                        }
                      : null,
                  child: userEmail == null
                      ? Text(
                          'Sign in',
                          style: TextStyle(
                            color: _isHovering[3] ? Colors.white : Colors.white70,
                          ),
                        )
                      : Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: imageUrl != null
                                  ? NetworkImage(imageUrl)
                                  : null,
                              child: imageUrl == null
                                  ? Icon(
                                      Icons.account_circle,
                                      size: 30,
                                    )
                                  : Container(),
                            ),
                            SizedBox(width: 5),
                            Text(
                              name ?? userEmail,
                              style: TextStyle(
                                color: _isHovering[3]
                                    ? Colors.white
                                    : Colors.white70,
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: _isProcessing
                                  ? null
                                  : () async {
                                      setState(() {
                                        _isProcessing = true;
                                      });
                                      await signOut().then((result) {
                                        print(result);
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) => HomePage(),
                                          ),
                                        );
                                      }).catchError((error) {
                                        print('Sign Out Error: $error');
                                      });
                                      setState(() {
                                        _isProcessing = false;
                                      });
                                    },
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 8.0,
                                  bottom: 8.0,
                                ),
                                child: _isProcessing
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Sign out',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            )
                          ],
                        ),
                ),*/
            ],
          ),
        ),
      ),
    );
  }
}

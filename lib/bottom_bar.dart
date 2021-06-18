import 'package:webapp/responsive.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      color: Theme.of(context).bottomAppBarColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                      s4: 'Courses',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'FAQ',
                      s2: 'Customer Support',
                      s3: '',
                      s4: '',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                      s4: 'Instagram',
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                InfoText(
                  type: 'Email',
                  text: 'technexi.india@gmail.com',
                ),
                SizedBox(height: 5),
                InfoText(
                  type: 'Address',
                  text: 'B-10, Bengaluru - 560017',
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | TechNEXI',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                      s4: 'Courses',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'FAQ',
                      s2: 'Customer Support',
                      s3: '',
                      s4: '',
                    ),
                    BottomBarColumn(
                      heading: 'FIND US ON',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                      s4: 'Instagram',
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: 'technexi.india@gmail.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: 'B-10, Bengaluru - 560017',
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | TechNEXI',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;
  final String s4;

  BottomBarColumn({
    @required this.heading,
    @required this.s1,
    this.s2,
    this.s3,
    this.s4,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            s1,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Text(
            s2,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Text(
            s3,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Text(
            s4,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String type;
  final String text;

  InfoText({this.type, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blueGrey[700],
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}

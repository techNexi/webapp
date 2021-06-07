import 'package:webapp/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key key,
    this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.02,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(),
                Text(
                  'SERVICE BEYOND COMPROMISE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                /*  Text(
                  'FEATURES',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ),*/
                SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'SERVICE BEYOND COMPROMISE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /* Expanded(
                  child: Text(
                    'FEATURES',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                ),*/
              ],
            ),
    );
  }
}

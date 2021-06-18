import 'package:flutter/material.dart';
import 'package:webapp/theme.dart';

class PcCustom extends StatefulWidget {
  const PcCustom({Key key}) : super(key: key);

  @override
  _PcCustomState createState() => _PcCustomState();
}

class _PcCustomState extends State<PcCustom> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: PCAppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      /* appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("Open app drawer here");
            },
          ),
        ],
      ),*/
      body: Column(
        children: [],
      ),
    );
  }
}

class PCAppDrawer extends StatelessWidget {
  const PCAppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: height * 0.03125,
            left: width * 0.0625,
            bottom: height * 0.03125,
            right: width * 0.0625),
        child: Column(
          children: [
            Text("App drawer Content 1 +"),
            Text("App drawer Content 2 +"),
            Text("App drawer Content 3 +"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ServicesDesc extends StatefulWidget {
  const ServicesDesc({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ServicesDescState createState() => _ServicesDescState();
}

class _ServicesDescState extends State<ServicesDesc> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Container(
                  width: width,
                  height: height * 0.8,
                  color: Colors.pink,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Body for ${widget.title} comes here",
                        style: TextStyle(fontSize: width * 0.08),
                      ),
                    ),
                  )),
              Container(
                width: width,
                height: height * 0.8,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

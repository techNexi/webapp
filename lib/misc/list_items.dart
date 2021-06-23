import 'package:flutter/material.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:webapp/responsive.dart';
import 'package:webapp/theme.dart';

class PopUpItem extends StatefulWidget {
  const PopUpItem({
    Key key,
    @required this.title,
    this.childBeforeSlider,
    this.childAfterSlider,
  }) : super(key: key);
  final String title;
  final Widget childBeforeSlider;
  final Widget childAfterSlider;

  @override
  _PopUpItemState createState() => _PopUpItemState();
}

class _PopUpItemState extends State<PopUpItem> {
  bool expandedItem1 = false;
  AnimateIconController controller = AnimateIconController();
  final GlobalKey<FormState> _formStateKey1 = GlobalKey<FormState>();
  String errorMessage = '';
  String successMessage = '';
  String _emailId;
  String _password;
  bool selectedIntel = false;
  bool selectedAMD = false;
  final _emailIdController = TextEditingController(text: '');
  final _phoneNumberController = TextEditingController(text: '');
  double _currentSliderValue = 70000;

  String validatePhoneNumber(String value) {
    if (value.trim().isEmpty && value.trim().length != 10) {
      return 'Number is invalid';
    }
    return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value))
      return 'Enter Valid Email Id!!!';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: ResponsiveWidget.isSmallScreen(context) ? 380 : width / 3,
      child: Column(
        children: [
          Container(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black87,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: fontFamily,
                    ),
                  ),
                  AnimateIcons(
                    endIconColor: Colors.white,
                    startIconColor: Colors.white,
                    endIcon: Icons.close,
                    startIcon: Icons.add,
                    controller: controller,
                    onStartIconPress: () {
                      controller.animateToEnd();
                      setState(() {
                        expandedItem1 = true;
                      });
                      return true;
                    },
                    onEndIconPress: () {
                      controller.animateToStart();
                      setState(() {
                        expandedItem1 = false;
                      });
                      return true;
                    },
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  if (expandedItem1) {
                    controller.animateToStart();
                    setState(() {
                      expandedItem1 = false;
                    });
                  } else {
                    controller.animateToEnd();
                    setState(() {
                      expandedItem1 = true;
                    });
                  }
                });
              },
            ),
          ),
          AnimatedSwitcher(
            switchInCurve: Curves.ease,
            switchOutCurve: Curves.ease,
            reverseDuration: Duration(milliseconds: 600),
            duration: Duration(milliseconds: 600),
            child: expandedItem1
                ? Padding(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Form(
                          key: _formStateKey1,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 2, color: Colors.white70)),
                                child: ListTile(
                                  title: Text(
                                    "Processor",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: ResponsiveWidget.isSmallScreen(
                                              context)
                                          ? 15
                                          : 18,
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIntel = true;
                                            selectedAMD = false;
                                          });
                                        },
                                        child: Container(
                                            width:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 40
                                                    : 60,
                                            height:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 27
                                                    : 40,
                                            decoration: BoxDecoration(
                                                color: !selectedIntel
                                                    ? Colors.white54
                                                    : Colors.blue[300],
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: Text(
                                                "Intel",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                          width: ResponsiveWidget.isSmallScreen(
                                                  context)
                                              ? 0
                                              : 5),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedAMD = true;
                                            selectedIntel = false;
                                          });
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: !selectedAMD
                                                    ? Colors.white54
                                                    : Colors.red[900],
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 40
                                                    : 60,
                                            height:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 27
                                                    : 40,
                                            child: Center(
                                              child: Text(
                                                "AMD",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              widget.childBeforeSlider != null
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 15.0),
                                      child: widget.childBeforeSlider,
                                    )
                                  : SizedBox.shrink(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Selected Price Range",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 10
                                                    : 15,
                                          ),
                                        ),
                                        Text(
                                          " Rs.${_currentSliderValue.toString()}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 13
                                                    : 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Slider(
                                      mouseCursor: MouseCursor.defer,
                                      activeColor: Colors.white,
                                      value: _currentSliderValue,
                                      min: 30000,
                                      max: 300000,
                                      divisions: 100,
                                      label: _currentSliderValue
                                          .round()
                                          .toString(),
                                      onChanged: (double value) {
                                        setState(() {
                                          _currentSliderValue = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              widget.childAfterSlider != null
                                  ? Padding(
                                      padding: EdgeInsets.only(bottom: 15.0),
                                      child: widget.childAfterSlider,
                                    )
                                  : SizedBox.shrink(),
                              TextFormField(
                                onSaved: (value) {
                                  _emailId = value;
                                },
                                maxLength: 500,
                                keyboardType: TextInputType.multiline,
                                controller: _emailIdController,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white54, width: 2.0),
                                    ),
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(
                                            color: Colors.white70, width: 2.0)),
                                    labelText: 'Short description(optional)',
                                    hintText: "Short description(optioinal)"),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 0),
                                //padding: EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  validator: validatePhoneNumber,
                                  onSaved: (value) {
                                    _password = value;
                                  },
                                  controller: _phoneNumberController,
                                  decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white54, width: 2.0),
                                      ),
                                      border: OutlineInputBorder(),
                                      labelText: 'Whatsapp Number',
                                      hintText: 'Enter Your Phone Number'),
                                ),
                              ),
                              (errorMessage != ''
                                  ? Text(
                                      errorMessage,
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : Container()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              ResponsiveWidget.isSmallScreen(context) ? 10 : 20,
                        ),
                        Container(
                          height:
                              ResponsiveWidget.isSmallScreen(context) ? 35 : 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black54,
                            ),
                            child: Text(
                              'Get Quote',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize:
                                    ResponsiveWidget.isSmallScreen(context)
                                        ? 15
                                        : 18,
                                fontFamily: fontFamily,
                              ),
                            ),
                            onPressed: () {
                              if (_formStateKey1.currentState.validate()) {
                                _formStateKey1.currentState.save();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

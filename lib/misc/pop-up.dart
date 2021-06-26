import 'package:flutter/material.dart';

class FunkyOverlay extends StatefulWidget {
  const FunkyOverlay(
      {Key key, @required this.child, @required this.backgroundColor})
      : super(key: key);
  final Widget child;
  final Color backgroundColor;
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 650));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
              color: widget.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

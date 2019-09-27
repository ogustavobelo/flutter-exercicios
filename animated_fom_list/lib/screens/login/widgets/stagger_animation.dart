import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({this.controller})
      : buttonSqueeze = Tween(begin: 320.0, end: 60.0).animate(
            CurvedAnimation(curve: Interval(0.0, 0.150), parent: controller)),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 1, curve: Curves.bounceOut)));

  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: InkWell(
            onTap: () {
              controller.forward();
            },
            child: Hero(
              tag: "fade",
              child: buttonZoomOut.value <= 60
                  ? Container(
                      width: buttonSqueeze.value,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: _buildInside(context))
                  : Container(
                      width: buttonZoomOut.value,
                      height: buttonZoomOut.value,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: buttonZoomOut.value <= 500
                              ? BoxShape.circle
                              : BoxShape.rectangle),
                    ),
            )));
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      return Text(
        "Sign In",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 0.3,
            fontWeight: FontWeight.bold),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

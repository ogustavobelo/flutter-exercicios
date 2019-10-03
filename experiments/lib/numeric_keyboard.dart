import 'package:flutter/material.dart';

class NumericKeyboard extends StatelessWidget {
  final String label;
  final Function callback;
  final Color pressColor;
  NumericKeyboard({this.label, this.callback, this.pressColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: RaisedButton(
        color: Colors.transparent,
        splashColor: pressColor,
        elevation: 0.0,
        onPressed: callback,
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }
}

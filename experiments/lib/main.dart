import 'package:experiments/fill_token.dart';
import 'package:experiments/numeric_keyboard.dart';
import 'package:experiments/pick_token.dart';
import 'package:experiments/slider_test.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: FillToken(),
    );
  }
}

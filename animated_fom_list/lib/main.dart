import 'package:animated_fom_list/screens/home/home_screen.dart';
import 'package:animated_fom_list/screens/intro_anim.dart';
import 'package:animated_fom_list/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroAnim(),
    );
  }
}

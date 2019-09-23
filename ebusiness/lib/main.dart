import 'package:ebusiness/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141),
      ),
    );
  }
}

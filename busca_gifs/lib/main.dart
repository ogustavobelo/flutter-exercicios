import 'package:busca_gifs/pages/gif_page.dart';
import 'package:flutter/material.dart';
import 'package:busca_gifs/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      )));
}

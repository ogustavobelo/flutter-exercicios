import 'package:ebusiness/models/cart_model.dart';
import 'package:ebusiness/models/user_model.dart';
import 'package:ebusiness/pages/home_screen.dart';
import 'package:ebusiness/pages/login_screen.dart';
import 'package:ebusiness/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            return ScopedModel<CartModel>(
              model: CartModel(model),
              child: MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                home: HomeScreen(),
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: Color.fromARGB(255, 211, 118, 130),
                ),
              ),
            );
          },
        ));
  }
}

//Color.fromARGB(255, 4, 125, 141)

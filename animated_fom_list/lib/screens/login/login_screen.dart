import 'package:animated_fom_list/screens/home/home_screen.dart';
import 'package:animated_fom_list/screens/login/widgets/form_container.dart';
import 'package:animated_fom_list/screens/login/widgets/signup_button.dart';
import 'package:animated_fom_list/screens/login/widgets/stagger_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/login_bg.jpeg"), fit: BoxFit.cover),
        ),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 70),
                      child: Icon(
                        Icons.check,
                        size: 200,
                        color: Colors.white,
                      ),
                    ),
                    FormContainer(),
                    SignupButton(),
                  ],
                ),
                StaggerAnimation(controller: _animationController.view),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

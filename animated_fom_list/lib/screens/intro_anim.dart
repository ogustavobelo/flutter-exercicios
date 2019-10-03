import 'package:animated_fom_list/screens/login/login_screen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

//ADD FLARE PUB, ASSETS ANIMATION, AND REPLACE SCREE

class IntroAnim extends StatefulWidget {
  @override
  _IntroAnimState createState() => _IntroAnimState();
}

class _IntroAnimState extends State<IntroAnim> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 4100)).then((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.purple[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 250,
              width: 250,
              child: FlareActor(
                "assets/animations/logo_animation.flr",
                animation: "initial_loading",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

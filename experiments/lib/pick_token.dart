import 'package:flutter/material.dart';

import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';

class PickToken extends StatefulWidget {
  @override
  _PickTokenState createState() => _PickTokenState();
}

class _PickTokenState extends State<PickToken>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool animate = false;
  double _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        lowerBound: 0,
        upperBound: 0.1)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size.width,
             
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: Text(
                      '2',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            RaisedButton(
              highlightColor: Colors.red,
              highlightElevation: 10.0,
              onPressed: () {
                setAnimate();
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.bounceInOut,
                height: animate ? 100 : 80,
                width: animate ? 100 : 80,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: animate ? 5 : 0, color: Colors.blue[100]),
                  color: animate ? Colors.blue[300] : Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'MudaCor',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setAnimate() {
    setState(() {
      animate = !animate;

      print(animate);
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        animate = !animate;
      });
    });
  }


import 'package:flutter/material.dart';

import 'numeric_keyboard.dart';

class FillToken extends StatefulWidget {
  @override
  _FillTokenState createState() => _FillTokenState();
}

class _FillTokenState extends State<FillToken> {
  List<String> _token = ['', '', '', ''];
  int position = 0;
  List<String> validToken = ['', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15.0,
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: -5.0,
                          offset: Offset(0, 10.0))
                    ]),
                child: Center(
                  child: Text(
                    _token[0],
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15.0,
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: -5.0,
                          offset: Offset(0, 10.0))
                    ]),
                child: Center(
                  child: Text(
                    _token[1],
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NumericKeyboard(
                label: '1',
                pressColor: Colors.purple,
                callback: () {
                  setToken('1');
                },
              ),
              NumericKeyboard(
                label: '2',
                callback: () {},
                pressColor: Colors.purple,
              ),
              NumericKeyboard(
                label: '3',
                callback: () {},
                pressColor: Colors.purple,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NumericKeyboard(
                label: '4',
                pressColor: Colors.purple,
                callback: () {},
              ),
              NumericKeyboard(
                label: '5',
                callback: () {},
                pressColor: Colors.purple,
              ),
              NumericKeyboard(
                label: '6',
                callback: () {},
                pressColor: Colors.purple,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              NumericKeyboard(
                label: '7',
                pressColor: Colors.purple,
                callback: () {},
              ),
              NumericKeyboard(
                label: '8',
                callback: () {},
                pressColor: Colors.purple,
              ),
              NumericKeyboard(
                label: '9',
                callback: () {},
                pressColor: Colors.purple,
              ),
            ],
          ),
          NumericKeyboard(
            label: '0',
            callback: () {},
            pressColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  void setToken(String digit) {
    setState(() {
      _token.insert(position, digit);
      position++;
      print(_token);
    });
  }
}

import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final List<String> categories = ["ESTUDAR", "TRABALHAR", "EXERCITAR"];
  int _category = 0;

  void selectForw() {
    setState(() {
      _category++;
    });
  }

  void selectBackw() {
    setState(() {
      _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: _category > 0 ? selectBackw : null,
        ),
        Text(
          categories[_category],
          style:
              TextStyle(color: Colors.white, fontSize: 25, letterSpacing: 1.2),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.white,
          onPressed: _category < categories.length - 1 ? selectForw : null,
        ),
      ],
    );
  }
}

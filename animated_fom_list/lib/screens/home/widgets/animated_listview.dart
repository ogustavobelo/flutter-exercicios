import 'package:flutter/material.dart';

import 'list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: "Estudar Flutter",
          subtitle: "Curso Daniel Ciofi",
          image: AssetImage("images/profile.png"),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: "Estudar Flutter 2",
          subtitle: "Curso Daniel Ciofi 2",
          image: AssetImage("images/profile.png"),
          margin: listSlidePosition.value * 0,
        ),
      ],
    );
  }
}

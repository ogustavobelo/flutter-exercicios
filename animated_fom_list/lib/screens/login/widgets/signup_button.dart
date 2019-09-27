import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 120),
      child: Text(
        "Não possui uma conta? Cadastre-se.",
        overflow: TextOverflow.fade,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
      onPressed: () {},
    );
  }
}

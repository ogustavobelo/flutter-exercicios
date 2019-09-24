import 'package:ebusiness/models/user_model.dart';
import 'package:ebusiness/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(fontSize: 14),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
            ),
          ],
        ),
        body:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text.isEmpty || !text.contains("@"))
                      return "E-mail Inválido";
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return "Senha Inválida";
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text("Esqueci a senha"),
                    onPressed: () {
                      if (_emailController.text.isEmpty) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Insira seu email para recuperação"),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 2),
                        ));
                      } else {
                        model.recoverPass(_emailController.text);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content:
                              Text("Foi enviado as instruções para seu Email"),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 45,
                  child: RaisedButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        model.signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao Logar"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}

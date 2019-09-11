import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _textInfo = 'Informe seus dados';

  void _resetField() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _textInfo = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está baixo do Peso";
      } else if (imc > 18.6 && imc < 24.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está no seu Peso Ideal";
      } else if (imc > 24.9 && imc < 29.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está Levemente acima do Peso";
      } else if (imc > 29.9 && imc < 34.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está com Obesidade grau 1";
      } else if (imc > 34.9 && imc < 39.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está com Obesidade grau 2";
      } else if (imc > 39.9) {
        _textInfo =
            "IMC: ${imc.toStringAsPrecision(3)} \n Você está com Obesidade grau 3";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetField,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person_pin,
                  size: 120,
                  color: Colors.deepPurple,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso (kg) ",
                    labelStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                  controller: weightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira seu peso!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Altura (cm) ",
                    labelStyle: TextStyle(color: Colors.deepPurple),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple, fontSize: 25),
                  controller: heightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira sua altura!";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _calculate();
                        }
                      },
                      child: Text(
                        "Calular",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Text(
                  _textInfo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

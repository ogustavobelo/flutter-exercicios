import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _itemController = TextEditingController();
  List _toDoList = [];

  @override
  void initState() {
    super.initState();

    _readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToDo() {
    setState(() {
      if (!_itemController.text.isEmpty) {
        Map<String, dynamic> newToDo = Map();
        newToDo['title'] = _itemController.text;
        _itemController.text = '';
        newToDo['done'] = false;
        _toDoList.add(newToDo);
        _saveData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _itemController,
                  decoration: InputDecoration(
                    labelText: "Nova Tarefa",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.white,
                child: Text("ADD"),
                textColor: Colors.pink,
                onPressed: _addToDo,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: _toDoList.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(_toDoList[index]['title']),
                  value: _toDoList[index]['done'],
                  onChanged: (c) {
                    setState(() {
                      _toDoList[index]["done"] = c;
                      _saveData();
                    });
                  },
                  secondary: CircleAvatar(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      child: Icon(_toDoList[index]['done']
                          ? Icons.check
                          : Icons.error_outline)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);

    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}

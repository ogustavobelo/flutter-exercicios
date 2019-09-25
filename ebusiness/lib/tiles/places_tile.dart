import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlacesTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  PlacesTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Image.network(
              snapshot.data['image'],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data['title'],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  snapshot.data['address'],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch(
                      "https://www.google.com/maps/search/?api=1&query=${snapshot.data['lat']},${snapshot.data['long']}");
                },
                child: Text("Ver no Mapa",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 18)),
              ),
              FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch("tel:${snapshot.data['phone']}");
                },
                child: Text("Ligar",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 18)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

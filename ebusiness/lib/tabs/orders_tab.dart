import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusiness/models/user_model.dart';

import 'package:ebusiness/pages/login_screen.dart';
import 'package:ebusiness/tiles/order_tile.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UserModel.of(context).isLoggedIn()) {
      String uid = UserModel.of(context).firebaseUser.uid;
      return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("users")
            .document(uid)
            .collection("orders")
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          else
            return ListView(
              children: snapshot.data.documents
                  .map((doc) {
                    return OrderTile(doc.documentID);
                  })
                  .toList()
                  .reversed
                  .toList(),
            );
        },
      );
    } else {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.remove_shopping_cart,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              "Faça o login para acompanhar os pedidos",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("Entrar"),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
      );
    }
  }
}

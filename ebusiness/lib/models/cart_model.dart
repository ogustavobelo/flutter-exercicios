import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusiness/datas/cart_product.dart';
import 'package:ebusiness/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  UserModel user;
  List<CartProduct> products = [];

  bool isLoading = false;

  CartModel(this.user) {
    if (user.isLoggedIn()) {
      _loadCardItems();
    }
  }

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);

  void addCartItem(CartProduct cartProduct) {
    products.add(cartProduct);

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .add(cartProduct.toMap())
        .then((doc) {
      cartProduct.cid = doc.documentID;
    });
    notifyListeners();
  }

  void removeCartItem(CartProduct cartProduct) {
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .delete();
    products.remove(cartProduct);
    notifyListeners();
  }

  void decProduct(CartProduct cartProduct) {
    cartProduct.quantity -= 1;

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

  void incProduct(CartProduct cartProduct) {
    cartProduct.quantity += 1;

    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .document(cartProduct.cid)
        .updateData(cartProduct.toMap());

    notifyListeners();
  }

  void _loadCardItems() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("cart")
        .getDocuments();

    products =
        query.documents.map((doc) => CartProduct.fromDocument(doc)).toList();
    notifyListeners();
  }
}

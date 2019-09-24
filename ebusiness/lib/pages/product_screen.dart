import 'package:carousel_pro/carousel_pro.dart';
import 'package:ebusiness/datas/cart_product.dart';
import 'package:ebusiness/datas/products_data.dart';
import 'package:ebusiness/models/cart_model.dart';
import 'package:ebusiness/models/user_model.dart';
import 'package:ebusiness/pages/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:ebusiness/pages/cart_screen.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;
  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;
  String size;
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: product.images.map((url) {
                return Image.network(
                  url,
                  fit: BoxFit.cover,
                );
              }).toList(),
              dotSize: 7,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                )
              ],
            ),
          ),
          SizedBox(height: 28),
          Text(
            "Tamanhos: ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 35,
            child: GridView(
              padding: EdgeInsets.all(4),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 8, childAspectRatio: 0.5),
              children: product.sizes.map((s) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      size = s;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: size == s ? primaryColor : null,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                          color: size == s ? primaryColor : Colors.grey,
                          width: 2),
                    ),
                    width: 50,
                    alignment: Alignment.center,
                    child: Text(
                      s,
                      style: TextStyle(
                          color: size == s ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 45,
            child: RaisedButton(
              onPressed: size != null
                  ? () {
                      if (UserModel.of(context).isLoggedIn()) {
                        CartProduct cartProduct = CartProduct();

                        cartProduct.size = size;
                        cartProduct.quantity = 1;
                        cartProduct.pid = product.id;
                        cartProduct.category = product.category;
                        cartProduct.productData = product;

                        CartModel.of(context).addCartItem(cartProduct);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartScreen()));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }
                    }
                  : null,
              child: Text(
                UserModel.of(context).isLoggedIn()
                    ? "Adicionar ao Carrinho"
                    : "Entre para Comprar",
                style: TextStyle(fontSize: 18),
              ),
              color: primaryColor,
              textColor: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Descrição: ",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
          Text(
            product.description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

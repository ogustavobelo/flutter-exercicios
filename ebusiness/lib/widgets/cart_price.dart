import 'package:ebusiness/models/cart_model.dart';
import 'package:ebusiness/pages/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CartPrice extends StatelessWidget {
  final VoidCallback buy;

  CartPrice(this.buy);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(20),
        child:
            ScopedModelDescendant<CartModel>(builder: (context, child, model) {
          double price = model.getProductsPrice();
          double discount = model.getDiscountPrice();
          double ship = model.getShipPrice();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Resumo do Pedido",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Subtotal"),
                  Text("R\$ ${price.toStringAsFixed(2)}"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Desconto"),
                  Text("R\$ - ${discount.toStringAsFixed(2)}"),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Entrega"),
                  Text("R\$ ${ship.toStringAsFixed(2)}"),
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Total", style: TextStyle(fontWeight: FontWeight.w500)),
                  Text("R\$ ${(price - discount + ship).toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 18)),
                ],
              ),
              SizedBox(height: 10),
              RaisedButton(
                child: Text("Finalizar Pedido"),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () async {
                  String orderID = await model.finishOrder();
                  if (orderID != null)
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => OrderScreen(orderID)));
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}

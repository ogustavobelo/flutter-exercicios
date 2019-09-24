import 'package:ebusiness/tabs/home_tab.dart';
import 'package:ebusiness/tabs/products_tab.dart';
import 'package:ebusiness/widgets/cart_button.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.orange,
        ),
      ],
    );
  }
}

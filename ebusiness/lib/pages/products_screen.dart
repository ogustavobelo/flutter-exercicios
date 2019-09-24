import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebusiness/datas/products_data.dart';
import 'package:ebusiness/tiles/product_tile.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ProductsScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data['title']),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.list)),
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("products")
                .document(snapshot.documentID)
                .collection("items")
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    GridView.builder(
                      padding: EdgeInsets.all(5),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        ProductData data = ProductData.fromDocument(
                            snapshot.data.documents[index]);
                        data.category = this.snapshot.documentID;
                        return ProductTile("grid", data);
                      },
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(5),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        ProductData data = ProductData.fromDocument(
                            snapshot.data.documents[index]);
                        data.category = this.snapshot.documentID;

                        return ProductTile("list", data);
                      },
                    ),
                  ],
                );
              }
            },
          )),
    );
  }
}

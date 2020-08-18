import 'package:Online_shop/provider/products_provider.dart';
import 'package:Online_shop/widgets/productitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//connected to productoverview screen
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<Products>(context); //setting up listner
    final products = prodData.items; //this will give a list of items
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      //crossAxisCount: => number of colunm
      //childAspectRatio: => means height /width ratio
      //crossAxisSpacing => means spacing between colunm
      //mainAxisSpacing => spacing between rows
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
      ), //this will tell us how  grid  should be structured
      itemBuilder: (context, index) => Material(
        elevation: 20.0,
        borderRadius: BorderRadius.circular(20.0),
        child: ProductItem(
          id: products[index].id,
          title: products[index].title,
          imageUrl: products[index].imageUrl,
        ),
      ), //this will tell us what should be display on the screen
      itemCount: products.length,
    );
  }
}

import 'package:Online_shop/provider/products_provider.dart';
import 'package:Online_shop/widgets/productitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//connected to productoverview screen
class ProductGrid extends StatelessWidget {
  final bool showFavs;
  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<Products>(context); //setting up listner
    final products = showFavs
        ? prodData.favoriteItems
        : prodData.items; //this will give a list of items
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
        child: ChangeNotifierProvider.value(
          value: products[
              index], //i did this because i already created an instance of Product in Products class
          child: ProductItem(
              //As we use provider we don't need to pass argument any more
              // id: products[index].id,
              // title: products[index].title,
              // imageUrl: products[index].imageUrl,
              ),
        ),
      ), //this will tell us what should be display on the screen
      itemCount: products.length,
    );
  }
}

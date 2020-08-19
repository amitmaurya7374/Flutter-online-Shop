//this file show a detail page screen of product when it gets tapped.

import 'package:Online_shop/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String id;
  // final String title;
  // final double price;
  // final String description;
  // final String imageUrl;
  // ProductDetailScreen({
  //   this.description,
  //   this.id,
  //   this.title,
  //   this.price,
  //   this.imageUrl,
  // });
  static const routeName = 'product-detail-screen';
  @override
  Widget build(BuildContext context) {
    //extracting that id
    final productId = ModalRoute.of(context).settings.arguments as String;
    //Now i want all product data through that id;
    //listten :false means it would get  data from object and  update only first time when the screen is loaded
    //After that it will not update any data.
    //it will not listen for any changes whenever notifierlistener call

    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}

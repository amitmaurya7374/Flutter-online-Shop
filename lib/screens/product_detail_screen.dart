//this file show a detail page screen of product when it gets tapped.

import 'package:flutter/material.dart';

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
    //Now i want all product data through that id;//TODO:
    return Scaffold(
      appBar: AppBar(
        title: Text(productId),
      ),
    );
  }
}

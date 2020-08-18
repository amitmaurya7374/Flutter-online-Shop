//this will show over all product on a screen

import 'package:Online_shop/widgets/productgrid.dart';
import 'package:flutter/material.dart';

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff7b4397),
              Color(0xffdc2430),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ProductGrid(),
      ),
    );
  }
}

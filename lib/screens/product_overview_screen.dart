//this will show over all product on a screen

import 'package:Online_shop/models/product.dart';
import 'package:Online_shop/widgets/productitem.dart';
import 'package:flutter/material.dart';

class ProductOverViewScreen extends StatelessWidget {
  final List<Product> loadedDummyProducts = [
    //creating an instance of product object
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
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
        child: GridView.builder(
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
              id: loadedDummyProducts[index].id,
              title: loadedDummyProducts[index].title,
              imageUrl: loadedDummyProducts[index].imageUrl,
            ),
          ), //this will tell us what should be display on the screen
          itemCount: loadedDummyProducts.length,
        ),
      ),
    );
  }
}

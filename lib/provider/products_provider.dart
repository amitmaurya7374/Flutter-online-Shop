//this file is my state management file to mange bigger data
//Provider
//first you have to define your  Provider class
//then add a mixin by using with Keywaord
//And the mixin is ChangeNotifier class

import 'package:Online_shop/provider/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    //creating an instance of product object
    Product(
      id: 'p1',
      title: 'Wollen Sweater',
      description: 'A wollen-sheater - it is pretty warm!',
      price: 29.99,
      imageUrl:
          'https://cdn.21buttons.com/posts/1080x1350/f70d0072f1ee412dbb42b9caed89c225_1080x1350.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Hand Bag',
      description: 'A nice Hand bag.',
      price: 59.99,
      imageUrl:
          'https://cdn.21buttons.com/posts/1080x1350/decb0dc908d24bb79790cfde9ff9525d_1080x1350.jpg',
    ),
    Product(
      id: 'p3',
      title: ' Black Top',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://cdn.21buttons.com/posts/1080x1350/d71cba851a7946aaa471917082bcc938_1080x1350.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Boat',
      description: 'Prepare  for trip',
      price: 49.99,
      imageUrl:
          'https://cdn.21buttons.com/posts/1080x1350/75519373ea27424d9187dc0158043f3a_1080x1350.jpg',
    ),
    Product(
        id: 'p5',
        title: 'Warn fur coat',
        description: 'So Confortable',
        price: 200,
        imageUrl:
            'https://cdn.21buttons.com/posts/1080x1350/0cb76f71f64349fbb012f3849df4f7a3_1080x1350.jpg'),
  ]; // this is  a list which is only  accessable here
  //access this we add a getter which return a new list
  List<Product> get items {
    return [..._items]; //return a copy of a list
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}

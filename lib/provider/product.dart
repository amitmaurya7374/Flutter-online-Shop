//In this file we should define how a product should look like
//By defining a data model
//creating a blueprint

import 'package:flutter/foundation.dart';

//using changeNotifier  to listen for update when singleproduct changes there data
class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String description;
  bool isFavorite;
  //now we need a constructor
  //we need a constructor to pass a value in a class level variable
  //It only run once when object is created
  Product({
    @required this.id,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
    @required this.title,
    this.isFavorite = false, //assigning a default value
  });

  //logic for chnaging favourite to unfavourite or vice versa
  void toogleFavorites() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

//this file handle cart data and how cartItem look like

import 'package:flutter/material.dart';

class CartItem {
  //this tell how my single cart item would look like
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    this.id,
    this.price,
    this.quantity,
    this.title,
  });
}

class Cart with ChangeNotifier {
  //this class will handle a data of cart
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  //Now we add an items to our cart
  void addItem(
    String productId,
    String title,
    double price,
  ) {
    //check if cart has already that item
    if (_items.containsKey(productId)) {
      //we need to change only quantity
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      //we need to add item in our cart
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
  }
}

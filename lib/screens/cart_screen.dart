//this sis a cart screen
//it show a cart items

import 'package:Online_shop/provider/cart.dart';
import 'package:Online_shop/widgets/background_gradient.dart';
import 'package:Online_shop/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const nameRoute = 'cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: gradient(
        child: Column(
          children: [
            Card(
              color: Colors.white54,
              elevation: 20.0,
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      elevation: 15.0,
                      backgroundColor: Colors.deepPurple[300],
                      label: Text(
                        '\$ ' + cart.totalPrice.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RaisedButton(
                      splashColor: Colors.pink,
                      color: Colors.deepPurple[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      elevation: 10.0,
                      onPressed: () {
                        //implement the order  now functionality
                      },
                      child: Text(
                        'Order Now',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (context, index) => CartItems(
                  id: cart.items.values.toList()[index].id,
                  title: cart.items.values.toList()[index].title,
                  price: cart.items.values.toList()[index].price,
                  quantity: cart.items.values.toList()[index].quantity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

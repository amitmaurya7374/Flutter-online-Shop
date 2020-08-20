//this  file will create a cart Item

import 'package:Online_shop/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  final String id;
  final double price;
  final String productId;
  final int quantity;
  final String title;
  CartItems({
    this.productId,
    this.price,
    this.title,
    this.quantity,
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Dismissible(
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Are you sure ?'),
                  content: Text('Delete'),
                  actions: [
                    RaisedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    RaisedButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .removeItem(productId);
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        },
        direction: DismissDirection.endToStart,
        // onDismissed: (direction) {
        //   showDialog(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return AlertDialog(
        //           title: Text('Are you sure ?'),
        //           content: Text('Delete'),
        //           actions: [
        //             RaisedButton(
        //               child: Text('Cancel'),
        //               onPressed: () {
        //                 Navigator.pop(context);
        //               },
        //             ),
        //             RaisedButton(
        //               child: Text('Ok'),
        //               onPressed: () {
        //                 Provider.of<Cart>(context, listen: false)
        //                     .removeItem(productId);
        //                 Navigator.pop(context);
        //               },
        //             )
        //           ],
        //         );
        //       });
        // },
        key: ValueKey(id),
        background: Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.delete,
              size: 28,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xff4158D0),
              Color(0xffC850C0),
              Color(0xffFFCC70),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
        child: Card(
          elevation: 10.0,
          color: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                child: Text('\$$price'),
              ),
              title: Text(title),
              subtitle: Text('\$${(price * quantity)}'),
              trailing: Text('$quantity x'),
            ),
          ),
        ),
      ),
    );
  }
}

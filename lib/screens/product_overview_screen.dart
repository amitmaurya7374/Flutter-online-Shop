//this will show over all product on a screen

import 'package:Online_shop/provider/cart.dart';
import 'package:Online_shop/screens/cart_screen.dart';
import 'package:Online_shop/widgets/badge.dart';
import 'package:Online_shop/widgets/productgrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    // final productContainer = Provider.of<Products>(context,
    // listen: false); //i only wnat to get that data

    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          //creates a button that show a pop upmenu
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  // productContainer.showOnlyFavorites();
                  _showOnlyFavorite = true;
                } else {
                  // productContainer.showAll();
                  _showOnlyFavorite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cartData, childe) => Badge(
              child: childe,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.nameRoute);
              },
            ),
          )
        ],
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
        child: ProductGrid(_showOnlyFavorite),
      ),
    );
  }
}

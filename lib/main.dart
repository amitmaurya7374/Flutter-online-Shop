import 'package:Online_shop/provider/cart.dart';
import 'package:Online_shop/provider/products_provider.dart';
import 'package:Online_shop/screens/cart_screen.dart';
import 'package:Online_shop/screens/product_detail_screen.dart';
import 'package:Online_shop/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //this is a data container
    //we register a provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ), //it should return a new instance of provided class
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.purple,
        ),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.nameRoute: (context) => CartScreen(),
        },
      ),
    );
  }
}

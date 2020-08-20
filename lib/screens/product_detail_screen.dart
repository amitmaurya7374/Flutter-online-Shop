//this file show a detail page screen of product when it gets tapped.

import 'package:Online_shop/provider/products_provider.dart';
import 'package:Online_shop/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    //Now i want all product data through that id;
    //listten :false means it would get  data from object and  update only first time when the screen is loaded
    //After that it will not update any data.
    //it will not listen for any changes whenever notifierlistener call

    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: gradient(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 25.0,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  height: 400,
                  width: double.infinity,
                  child: Image.network(
                    loadedProduct.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                loadedProduct.price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

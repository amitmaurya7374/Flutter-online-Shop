import 'package:Online_shop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem({
    this.id,
    this.imageUrl,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.deepOrange,
            ),
            onPressed: () => print('show cart page'),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.deepOrange,
            ),
            onPressed: () => print('Liked that item'),
          ),
        ),
      ),
    );
  }
}

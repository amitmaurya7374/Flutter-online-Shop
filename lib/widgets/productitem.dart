import 'package:Online_shop/provider/product.dart';
import 'package:Online_shop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    print('provider rebuilds');
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.deepOrange,
            ),
            onPressed: () => print('show cart page'),
          ),
          trailing: Consumer<Product>(
            //consumer only rebuild the sub part of the tree
            //when there i no need to rebuild entire tree
            //it also have child argument which does not rebuild that part
            builder: (context, value, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.deepOrange,
              ),
              onPressed: () {
                product.toogleFavorites();
              },
            ),
          ),
        ),
      ),
    );
  }
}

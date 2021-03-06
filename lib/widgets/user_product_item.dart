import 'package:Online_shop/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return Card(
      elevation: 15.0,
      color: Colors.white54,
      child: ListTile(
        onLongPress: () async {
          try {
            await Provider.of<Products>(context, listen: false)
                .deleteProduct(id);
          } catch (error) {
            //this will give error
            // Scaffold.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text('Delete  Failed! :( '),
            //   ),
            // );

            //this is a solution
            scaffold.showSnackBar(
              SnackBar(
                content: Text('Delete  Failed! :( '),
              ),
            );
          }
        },
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: id,
          );
        },
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditProductScreen.routeName, arguments: id);
                },
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await Provider.of<Products>(context, listen: false)
                        .deleteProduct(id);
                  } catch (error) {
                    //this will give error
                    // Scaffold.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text('Delete  Failed! :( '),
                    //   ),
                    // );

                    //this is a solution
                    scaffold.showSnackBar(
                      SnackBar(
                        content: Text('Delete  Failed! :( '),
                      ),
                    );
                  }
                },
                color: Theme.of(context).errorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:Online_shop/providers/products.dart';
import 'package:Online_shop/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isDidDependancy = true;
  var _isLoading = false;

  ///Remember :That every thing data related to fetching can be
  ///Done in initState method so as soon as app start or reloads
  ///we will see latest data
  ///And here is a note that initSate run only once when app start
  /// logic should be in a model class
  @override
  void initState() {
    super.initState();
    // Provider.of<Products>(context).fetchProducts();//this will give error because of(context) thing does not work here beacuse widget is not fully wired up
    //Another way a trick to make it happened
    //Not a better approach
    // Future.delayed(Duration.zero).then(
    //     (_) => Provider.of<Products>(context, listen: false).fetchProducts());
  }

//this will run after initState but before build method
//As this run multiple time so we create a variable to handle that
  @override
  void didChangeDependencies() {
    if (_isDidDependancy) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchProducts().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isDidDependancy = false;
    super.didChangeDependencies();
  }

  Future<void> _refresh(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: gradient(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.purple,
                ),
              )
            : RefreshIndicator(
                onRefresh: () => _refresh(context),
                child: ProductsGrid(_showOnlyFavorites),
              ),
      ),
    );
  }
}

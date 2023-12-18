import 'package:flutter/material.dart' hide Badge;
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../widgets/app_drawer.dart';
import '../screens/cart_screen.dart';
import '../provider/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  favorite,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-overview';
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;

  @override
  void initState() {
    // Provider.of<Cart>(context, listen: false).fetchAndSetProducts(); // WON'T WORK! (context is not available)

    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context, listen: false).fetchAndSetProducts();
    // }); // WILL WORK! (context is available) // This is a hack to get around the initState() method not having
    //access to the context object. This is because the initState() method is executed before the widget is
    //fully initialized. So, we use the Future.delayed() method to execute the code inside the then() method
    //after the widget is fully initialized. This is a hack and not the best way to do this.
    //A better way to do this is using didChangeDependencies() method.
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Products>(context).fetchAndSetProducts();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Now'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorite,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('All products'),
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              key: const ValueKey('cartBadge'),
              color: Colors.red,
              child: ch!,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(showFavorites: _showOnlyFavorites),
    );
  }
}

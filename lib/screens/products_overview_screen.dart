import 'package:flutter/material.dart' hide Badge;
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum filterOptions {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Now'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (filterOptions selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.favorite) {
                  // productsContainer.showFavoritesOnly();
                  _showOnlyFavorites = true;
                } else {
                  // productsContainer.showAll();
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: filterOptions.favorite,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: filterOptions.all,
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
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: const ProductsGrid(),
    );
  }
}

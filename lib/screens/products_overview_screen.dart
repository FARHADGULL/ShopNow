import 'package:flutter/material.dart';
import 'package:shop_now/screens/product_detail_screen.dart';

import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/products-overview';
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Now'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (filterOptions value) {
              print(value);
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
          const Badge(
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: const ProductsGrid(),
    );
  }
}

import 'package:flutter/material.dart' hide Badge;
import 'package:provider/provider.dart';

import 'package:shop_now/screens/product_detail_screen.dart';

import '../provider/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

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

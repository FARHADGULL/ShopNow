import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

enum filterOptions {
  favorite,
  all,
}

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final laodedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(laodedProduct.title),
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
          )
        ],
      ),
      body: const Text('body'),
    );
  }
}

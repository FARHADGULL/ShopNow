import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products.dart';

enum FilterOptions {
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
            onSelected: (FilterOptions value) {
              print(value);
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(laodedProduct.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${laodedProduct.price}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                laodedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

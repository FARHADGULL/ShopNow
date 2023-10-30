import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/provider/products.dart';
import 'package:shop_now/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product-screen';

  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: productsData.items.length,
        itemBuilder: (_, index) => UserProductItem(
          title: productsData.items[index].title,
          imageUrl: productsData.items[index].imageUrl,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/products.dart';
import '/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts = productsData.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: ProductItem(
              // imgId: loadedProducts[index].id,
              // imgtitle: loadedProducts[index].title,
              // imgUrl: loadedProducts[index].imageUrl,
              ),
        );
      },
      itemCount: loadedProducts.length,
      padding: const EdgeInsets.all(20),
    );
  }
}

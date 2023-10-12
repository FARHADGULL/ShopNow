import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;
  const ProductsGrid({super.key, required this.showFavorites});

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
        // return ChangeNotifierProvider<Product>(
        //   create: (context) => loadedProducts[index],
        //   child: ProductItem(
        //       // imgId: loadedProducts[index].id,
        //       // imgtitle: loadedProducts[index].title,
        //       // imgUrl: loadedProducts[index].imageUrl,
        //       ),
        // );

        /*below method is used we have a single list or grid of products/items and we want to use 
        the same provider for all the items in the list/grid.
        Now the provider is tight to the data as well as to the widget so we can use 
        the ChangeNotifierProvider.value() method instead of ChangeNotifierProvider() method as we 
        are not creating a new object of the provider class but we are using the existing 
        object of the provider class*/
        return ChangeNotifierProvider.value(
          value: loadedProducts[index],
          child: const ProductItem(),
        );
      },
      itemCount: loadedProducts.length,
      padding: const EdgeInsets.all(20),
    );
  }
}

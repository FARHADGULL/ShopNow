import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String imgId;
  // final String imgtitle;
  // final String imgUrl;

  // const ProductItem({
  //   super.key,
  //   required this.imgId,
  //   required this.imgtitle,
  //   required this.imgUrl,
  // });

  @override
  Widget build(BuildContext context) {
    //below Provider.of<Product>(context) approach will rerun the whole build method whenever
    //the data changes in the provider class, thats why we use Consumer approach to avoid this
    //because consumer will only rerun the part of the widget tree which is wrapped inside the
    //consumer widget and not the whole build method. So we use Consumer approach when we want
    //to rebuild only a part of the widget tree and not the whole widget tree.

    //final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).hintColor,
              ),
              onPressed: () => product.toggleIsFav(),
            ),
          ),
          trailing: Consumer(
            builder: (context, product, child) => IconButton(
              onPressed: null,
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          title: Consumer<Product>(
            builder: (context, product, child) => Text(
              product.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        child: Consumer<Product>(
          builder: (context, product, child) => GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

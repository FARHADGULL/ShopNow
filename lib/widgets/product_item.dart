import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../provider/product.dart';

class ProductItem extends StatelessWidget {
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
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).hintColor,
            ),
            onPressed: () => product.toggleIsFav(),
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
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
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
    );
  }
}

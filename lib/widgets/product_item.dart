import 'package:flutter/material.dart';
import 'package:shop_now/screens/product_detail_screen.dart';

import '../provider/product.dart';
import 'package:provider/provider.dart';

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
              Icons.favorite,
              color: Theme.of(context).hintColor,
            ),
            onPressed: null,
          ),
          trailing: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).hintColor,
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

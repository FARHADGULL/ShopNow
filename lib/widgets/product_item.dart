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
    //final product = Provider.of<Product>(context);
    return Consumer<Product>(
      builder: (context, value, child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                value.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).hintColor,
              ),
              onPressed: () => value.toggleIsFav(),
            ),
            trailing: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).hintColor,
              ),
            ),
            title: Text(
              value.title,
              textAlign: TextAlign.center,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: value.id,
              );
            },
            child: Image.network(
              value.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

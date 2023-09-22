import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imgId;
  final String imgtitle;
  final String imgUrl;

  const ProductItem({
    super.key,
    required this.imgId,
    required this.imgtitle,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
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
            imgtitle,
            textAlign: TextAlign.center,
          ),
        ),
        child: Image.network(
          imgUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

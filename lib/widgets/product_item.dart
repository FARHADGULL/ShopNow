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
    return GridTile(
      child: Image.network(imgUrl),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: null,
        ),
        trailing: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.shopping_cart,
          ),
        ),
        title: Text(imgtitle),
      ),
    );
  }
}

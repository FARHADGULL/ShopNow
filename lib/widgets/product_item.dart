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
    return GridTile(child: Image.network(imgUrl));
  }
}

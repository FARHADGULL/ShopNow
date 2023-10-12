import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
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

    //but when i use the Provider.of<Product>(context) along with the listner as false then it
    //will not rebuild the widget tree when the data changes in the provider class but it will
    //only get the data from the provider class and not rebuild the widget tree. So we can use
    //this approach when we want to get the data from the provider class but dont want to rebuild
    //the widget tree when the data changes in the provider class.

    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, Cproduct, _) => IconButton(
              icon: Icon(
                Cproduct.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => product.toggleIsFav(),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(
                product.id,
                product.price,
                product.title,
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.red,
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

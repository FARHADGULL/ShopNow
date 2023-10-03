import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import '../screens/product_detail_screen.dart';
import '../screens/products_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Products>(
      create: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Now',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          hintColor: Colors.cyanAccent,
          fontFamily: 'Lato',
        ),
        initialRoute: ProductsOverviewScreen.routeName,
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
      ),
    );
  }
}

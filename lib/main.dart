import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/screens/user_product_screen.dart';

import '../screens/orders_screen.dart';
import '../screens/cart_screen.dart';
import '../provider/cart.dart';
import '../provider/products.dart';
import '../provider/order.dart';
import '../screens/product_detail_screen.dart';
import '../screens/products_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider<Orders>(
          create: (ctx) => Orders(),
        )
      ],
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
          ProductsOverviewScreen.routeName: (context) =>
              const ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
          UserProductsScreen.routeName: (context) => const UserProductsScreen(),
        },
      ),
    );
  }
}

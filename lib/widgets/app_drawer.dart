import 'package:flutter/material.dart';
import 'package:shop_now/screens/user_product_screen.dart';

import '../screens/orders_screen.dart';
import '../screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: (() {
              Navigator.of(context)
                  .pushReplacementNamed(ProductsOverviewScreen.routeName);
            }),
          ),
          ListTile(
            leading: const Icon(Icons.shop_2),
            title: const Text('Orders'),
            onTap: (() {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Products'),
            onTap: (() {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            }),
          ),
        ],
      ),
    );
  }
}

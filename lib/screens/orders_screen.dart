import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/widgets/app_drawer.dart';

import '../provider/order.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/order-screen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: ((context, index) =>
            OrderItem(order: orderData.orders[index])),
      ),
    );
  }
}

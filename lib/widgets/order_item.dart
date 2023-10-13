import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/order.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              onPressed: null,
              icon: Icon(Icons.expand_more),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  Chip(
                    label: Text('\$${cart.totalAmount.toString()}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('ORDER NOW'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) => CartItem(
                        title: cart.items[index].t,
                        quantity: cart.items[index].quantity,
                        price: cart.items[index].price,
                        id: cart.items[index].id),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

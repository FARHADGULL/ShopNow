import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.title,
    required this.quantity,
    required this.price,
    required this.id,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, double productPrice, String productTitle) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          title: existingCartItem.title,
          quantity: existingCartItem.quantity + 1,
          price: existingCartItem.price,
          id: existingCartItem.id,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          title: productTitle,
          price: productPrice,
          id: DateTime.now().toString(),
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}

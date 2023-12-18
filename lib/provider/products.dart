import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(
        'https://shop-now-a42b9-default-rtdb.firebaseio.com/products.json');
    try {
      final response = await http.get(url);
      print(json.decode(response.body));
    } catch (error) {
      throw error;
    }
  }

  //this appraoch is better than the one below commented as it is more readable and easy to understand and debug and also it is more efficient
  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        "https://shop-now-a42b9-default-rtdb.firebaseio.com/products.json");
    try {
      final response = await http.post(
        url,
        body: json.encode({
          "title": product.title,
          "description": product.description,
          "imageUrl": product.imageUrl,
          "isFav": product.isFavorite,
          "price": product.price
        }),
      );
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: 0,
        imageUrl: '',
      );
      _items.add(newProduct);
      //_items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  //this is the old approach without async and await and try and catch block and it is not efficient
  // Future<void> addProduct(Product product) {
  //   final url = Uri.parse(
  //       "https://console.firebase.google.com/project/shop-now-a42b9/database/shop-now-a42b9-default-rtdb/data/~2F/products.json");
  //   return http
  //       .post(url,
  //           body: json.encode({
  //             "title": product.title,
  //             "description": product.description,
  //             "imageUrl": product.imageUrl,
  //             "isFav": product.isFavorite,
  //             "price": product.price
  //           }))
  //       .then((response) {
  //     final newProduct = Product(
  //       id: json.decode(response.body)['name'],
  //       title: product.title,
  //       description: product.description,
  //       price: 0,
  //       imageUrl: '',
  //     );
  //     _items.add(newProduct);
  //     //_items.insert(0, newProduct); // at the start of the list
  //     notifyListeners();
  //   }).catchError((error) {
  //     print(error);
  //     throw error;
  //   });
  // }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);

    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}

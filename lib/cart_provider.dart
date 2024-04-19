import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _items = {};

  Map<String, Product> get items => _items;

  void addItem(Product product) {
    _items.putIfAbsent(product.id, () => product);
    notifyListeners();
  }

  double get totalAmount {
    return _items.values.fold(0.0, (sum, item) => sum + item.price);
  }
}

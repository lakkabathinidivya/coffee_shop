
import 'package:coffee_shop/components/product_model.dart';
import 'package:flutter/material.dart';

class ProductModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addItem(Product item) {
    if (items.contains(item)) {
      items.remove(item);
    }
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}

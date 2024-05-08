import 'package:coffee_shop/components/product_model.dart';
import 'package:flutter/material.dart';

class BagProvider extends ChangeNotifier {
  final List<Product> _bagItems = [];

  List<Product> get items => _bagItems;

  void addItem(Product item) {
    if (items.contains(item)) {
      items.firstWhere((element) => element.id == item.id).quantity +=
          item.quantity;
      // items.remove(item);
    } else {
      _bagItems.add(item);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _bagItems.removeAt(index);
    notifyListeners();
  }

  bool isAlreadyInBag(String cupSize, int id) {
    try {
      _bagItems.firstWhere(
        (element) => element.id == id && element.cupSize == cupSize,
        
      );
      return true;
    } catch (e) {
      return false;
    }
  }


  Product? getBagProducts (String cupSize, int id){
    try {
   return   _bagItems.firstWhere(
        (element) => element.id == id && element.cupSize == cupSize,
        
      );
    
    } catch (e) {
      return null ;
    }
  }
}

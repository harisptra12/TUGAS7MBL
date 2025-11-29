import 'package:flutter/foundation.dart';
import 'package:tugas7hari/model/product.dart';
//import 'Product.dart';

class Keranjang extends ChangeNotifier {
  List<Product> _items = [];

  List<Product> get item => _items;
  int get n => _items.length;

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }

  void remove(Product p) {
    _items.remove(p);
    notifyListeners();
  }
}
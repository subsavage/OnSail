import 'package:flutter/material.dart';
import '../models/product_models.dart';
import '../services/api_services.dart';

class Products with ChangeNotifier {
  Future<void> fetchAndSetProducts() async {
    try {
      List<Product> fetchedProducts = await fetchProducts();
      print(fetchedProducts);
      _items = fetchedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }
}

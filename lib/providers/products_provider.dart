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
      print(error);
    }
  }

  List<Product> _items = [];
  List<Product> get items => [..._items];

  final List<Product> _favorites = [];
  List<Product> get favorites => _favorites;

  final List<Product> _wishlist = [];
  List<Product> get wishlist => _wishlist;

  void addToFavorites(Product product) {
    _favorites.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }

  void addToWishList(Product product) {
    _wishlist.add(product);
    notifyListeners();
  }

  void removeFromWishList(Product product) {
    _wishlist.remove(product);
    notifyListeners();
  }
}

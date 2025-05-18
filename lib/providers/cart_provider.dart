import 'package:boutique/models/product.dart';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  bool isCartItems(Product product) {
    return _cartItems.any((p) => p.id == product.id);
  }

  void addToCart(Product product) {
    if (!isCartItems(product)) {
      _cartItems.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((p) => p.id == product.id);
    notifyListeners();
  }
}

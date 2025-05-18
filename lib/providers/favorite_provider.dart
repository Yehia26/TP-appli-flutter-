import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:boutique/models/product.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> _favorites = [];
  static const String _favoritesKey = 'favorites';

  FavoriteProvider() {
    _loadFavorites();
  }

  List<Product> get favorites => _favorites;

  bool isFavorite(Product product) {
    return _favorites.any((p) => p.id == product.id);
  }
  
  void addFavorite(Product product) {
    if (!isFavorite(product)) {
      _favorites.add(product);
      _saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(Product product) {
    _favorites.removeWhere((p) => p.id == product.id);
    _saveFavorites();
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey);
      
      if (favoritesJson != null) {
        _favorites = favoritesJson
            .map((item) => Product.fromJson(jsonDecode(item)))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Erreur lors du chargement des favoris: $e');
    }
  }

  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = _favorites
          .map((product) => jsonEncode(product.toJson()))
          .toList();
      
      await prefs.setStringList(_favoritesKey, favoritesJson);
    } catch (e) {
      debugPrint('Erreur lors de la sauvegarde des favoris: $e');
    }
  }

  void clearFavorites() {
    _favorites = [];
    _saveFavorites();
    notifyListeners();
  }
}
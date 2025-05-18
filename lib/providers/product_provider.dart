import 'package:boutique/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {

  Product? _product;

  Product? get product => _product;
  set product (Product? value){
    _product = value;
    notifyListeners();
  }

}
import 'package:boutique/models/categorie.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {

  Categorie? _categorie;

  Categorie? get categorie => _categorie;
  set category (Categorie? value){
    _categorie = value;
    notifyListeners();
  }

}
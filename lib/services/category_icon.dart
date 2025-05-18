import 'package:flutter/material.dart';

class CategoryIcon {
  final List<Map<String, dynamic>> _list = [
    {"slug": "clothes", "icon": Icons.checkroom},
    {"slug": "electronics", "icon": Icons.bolt},
    {"slug": "furniture", "icon": Icons.chair},
    {"slug": "shoes", "icon": Icons.ice_skating},
    {"slug": "miscellaneous", "icon": Icons.shuffle}
  ];

  IconData getIcon( String categorySlug){
    Map<String, dynamic> result = _list.firstWhere((category){
      return category["slug"] == categorySlug;
    });

    return result["icon"];
  } 

  bool categoryIsExists (String categorySlug){
    try {
      Map<String, dynamic> result = _list.firstWhere((category){
      return category["slug"] == categorySlug;
    });
    return result.isNotEmpty ? true : false;
    } catch (e) {
      return false;
    }
  }
}
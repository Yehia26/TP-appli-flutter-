import 'package:boutique/models/categorie.dart';

class Product {
  int? id;
  num? price;
  String? title, slug, description;
  Categorie? categorie;
  List<dynamic>? images;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.categorie,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "title": title,
      'price': price,
      'slug': slug,
      "description": description,
      "categorie": categorie?.toJson(),
      "images": images
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'], 
      price: json['price'],
      slug:  json['slug'],
      description: json['description'],
      categorie: json['categorie'] != null ? Categorie.fromJson(json['categorie']) : null, 
      images: json['images'] != null ? List<dynamic>.from(json['images']) : null,
    );
  }
}


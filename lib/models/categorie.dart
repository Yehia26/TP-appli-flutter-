class Categorie {
  int? id;
  String? name, slug, image;

  Categorie(
    {
      required this.id, 
      required this.name, 
      required this.slug,
      required this.image,
    }
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      "slug": slug,
      "image": image
    };
  }

   factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['id'],
      name: json['name'],
      slug: json["slug"],
      image: json["image"]
    );
  }
}
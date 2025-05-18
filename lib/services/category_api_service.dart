import "dart:convert";
import "package:boutique/models/categorie.dart";
import "package:boutique/models/product.dart";
import "package:http/http.dart" as http;

class CategoryApiService {
  Future<List<Categorie>> getCategories() async{

    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");
    
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      return data.map( (category){
        return Categorie(
          id: category["id"], 
          name: category["name"], 
          slug: category["slug"], 
          image: category["image"]);
      }).toList(); 
    }

    throw Error();
  }

  Future<List<Product>> getProductsByCategoryId(int categoryId) async{

    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories/$categoryId/products");
    
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      return data.map((product){
        return Product(
          id: product["id"], 
          title: product["title"], 
          slug: product["slug"], 
          price: product["price"],
          description: product["description"],
          categorie: Categorie(
            id: product["category"]["id"], 
            name: product["category"]["name"], 
            slug: product["category"]["slug"], 
            image:product["category"]["image"],
          ),
          images: product["images"]
        );
      }).toList(); 
    }
    throw Error();
  }

  Future<Product> getProductById(int id) async {
  Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products/$id");

  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> product = jsonDecode(response.body);

    return Product(
      id: product["id"],
      title: product["title"],
      slug: product["slug"],
      price: product["price"],
      description: product["description"],
      categorie: Categorie(
        id: product["category"]["id"],
        name: product["category"]["name"],
        slug: product["category"]["slug"],
        image: product["category"]["image"],
      ),
      images: product["images"],
    );
  }

  throw Exception("Erreur lors de la récupération du produit avec id $id");
}

}
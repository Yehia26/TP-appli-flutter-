import 'package:boutique/models/product.dart';
import 'package:boutique/providers/cart_provider.dart';
import 'package:boutique/providers/favorite_provider.dart';
import 'package:boutique/services/category_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boutique/providers/product_provider.dart';

class DetailProduitScreen extends StatelessWidget {
  const DetailProduitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = context.watch<ProductProvider>().product!; 
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            product.title!, 
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          FutureBuilder<Product>(
            future: CategoryApiService().getProductById(product.id!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Product data = snapshot.requireData;
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: data.images!.map((imgUrl) {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.network(
                              imgUrl, 
                              width: 60, 
                              height: 60
                            ),
                          );
                        }).toList(),
                        ),
                      SizedBox(height: 15,),
                      Text("${data.price}€"),
                      SizedBox(height: 15,),
                      Text("${data.description}"),
                      SizedBox(height: 15,),
                      ListTile(
                        title: Text("Ajouter aux favoris"),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: context.watch<FavoriteProvider>().isFavorite(product)
                                ? Colors.red
                                : Colors.grey,
                          ),
                          onPressed: () {
                            if (!context.read<FavoriteProvider>().isFavorite(product)) {
                              context.read<FavoriteProvider>().addFavorite(product);
                            }
                            else{
                              context.read<FavoriteProvider>().removeFavorite(product);
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      ListTile(
                        title: Text("Ajouter au panier"),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                             color: context.watch<CartProvider>().isCartItems(product)
                                ? Colors.amber
                                : Colors.grey,
                          ),
                          onPressed: () {
                            if (!context.read<CartProvider>().isCartItems(product)) {
                              context.read<CartProvider>().addToCart(product);
                            }
                            else{
                              context.read<CartProvider>().removeFromCart(product);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Center(child: Text("Aucune donnée")
                );
              }
            },
          )
        ]
      )
    );
  }
}
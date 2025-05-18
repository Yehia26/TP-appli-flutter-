import 'package:boutique/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteSreen extends StatelessWidget {
  const FavoriteSreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoriteProvider>().favorites;
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: favorites.length,
      itemBuilder: (context, index) {
        final product = favorites[index];
        return ListTile(
          title: Text("${product.title}"),
          subtitle: Text("${product.price}€"),
          leading: (product.images != null && product.images!.isNotEmpty)
              ? Image.network(product.images![0])
              : null,
        );
      },
    );

    
  }
}
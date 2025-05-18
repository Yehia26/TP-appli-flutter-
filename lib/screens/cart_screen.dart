import 'package:boutique/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().cartItems;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final product = cartItems[index];
        return ListTile(
          title: Text("${product.title}"),
          subtitle: Text("${product.price} €"),
          leading: product.images != null && product.images!.isNotEmpty
              ? Image.network(product.images![0])
              : null,
        );
      },
    );
  }
}

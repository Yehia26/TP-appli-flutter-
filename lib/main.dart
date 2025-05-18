import 'package:boutique/providers/cart_provider.dart';
import 'package:boutique/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boutique/providers/category_provider.dart';
import 'package:boutique/providers/product_provider.dart';
import 'package:boutique/services/router_service.dart';
import 'package:boutique/theme/app_theme.dart';

void main() => runApp( 
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ChangeNotifierProvider(create: (context) => CartProvider()),
    ],
    child: MyStore(),
  ),
);


class MyStore extends StatelessWidget {
  const MyStore({super.key});

//
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "My Store", 
      theme: AppTheme().getTheme(),
      routerConfig:RouterService().getRouter(),
    );
  }
}
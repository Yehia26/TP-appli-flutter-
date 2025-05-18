import 'package:boutique/layouts/root_layout.dart';
import 'package:boutique/screens/cart_screen.dart';
import 'package:boutique/screens/category_screen.dart';
import 'package:boutique/screens/detail_produit_screen.dart';
import 'package:boutique/screens/favorite_sreen.dart';
import 'package:boutique/screens/home_screen.dart';
import 'package:boutique/screens/login_sreen.dart';
import 'package:go_router/go_router.dart';

class RouterService {
  GoRouter getRouter(){
    return GoRouter(
      routes: [
        GoRoute(
          path: "/", 
          name: "home", 
          builder: (context, state) => RootLayout(screen: HomeScreen()),
        ),
        GoRoute(
          path: "/category", 
          name: "category", 
          builder: (context, state) => RootLayout(screen: CategoryScreen()),
        ),
        GoRoute(
          path: "/login", 
          name: "login", 
          builder: (context, state) => RootLayout(screen: LoginSreen()),
        ),
        GoRoute(
          path: "/details", 
          name: "details", 
          builder: (context, state) => RootLayout(screen: DetailProduitScreen()),
        ),
        GoRoute(
          path: "/favorite", 
          name: "favorite", 
          builder: (context, state) => RootLayout(screen: FavoriteSreen()),
        ),
        GoRoute(
          path: "/panier", 
          name: "panier", 
          builder: (context, state) => RootLayout(screen: CartScreen()),
        )
      ]
    );
  }
}
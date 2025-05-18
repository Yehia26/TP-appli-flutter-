import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("My Store"), 
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {
          context.pushNamed("favorite");
        }, 
          icon: Icon(Icons.favorite)),
        IconButton(onPressed: () {
          context.pushNamed("panier");
        }, icon: Icon(Icons.shopping_cart)),
        IconButton(onPressed: (){
          context.replaceNamed("login");
          }, 
          icon: Icon((Icons.person))),
        ]);
  }
  
  @override
  Size get preferredSize => Size.fromHeight(56);
}


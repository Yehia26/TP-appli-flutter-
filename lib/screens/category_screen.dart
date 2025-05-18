import 'package:boutique/models/categorie.dart';
import 'package:boutique/models/product.dart';
import 'package:boutique/providers/category_provider.dart';
import 'package:boutique/providers/product_provider.dart';
import 'package:boutique/services/category_api_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Categorie categorie = context.watch<CategoryProvider>().categorie!; 
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            categorie.name!, 
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          FutureBuilder(
            future: CategoryApiService().getProductsByCategoryId(categorie.id!), 
            builder: (context, snapshot){
              if(snapshot.hasData){
                List<Product> data = snapshot.requireData;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(data[index].images![0]),
                      title: Text(data[index].title!),
                      subtitle: Text("${data[index].price!}€"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        context.read<ProductProvider>().product = data[index] ;
                        context.pushNamed("details");
                        
                      },
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            })
        ],
      ),
    );
  }
}
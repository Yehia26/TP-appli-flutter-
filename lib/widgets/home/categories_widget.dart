import 'package:boutique/models/categorie.dart';
import 'package:boutique/providers/category_provider.dart';
import 'package:boutique/services/category_api_service.dart';
import 'package:boutique/services/category_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';



class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder(future: CategoryApiService().getCategories(), builder: (context, snapshot){
        if(snapshot.hasData){
          List<Categorie> data = snapshot.requireData;
          return SizedBox(
            height: 150,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1
              ), 
              itemBuilder: (context, index){
                if (CategoryIcon().categoryIsExists(data[index].slug!)){
                  return InkWell(
                    onTap:() {
                      context.read<CategoryProvider>().category = data[index] ;
                      context.pushNamed("category");
                    } ,
                    child: Column(
                      children: [
                        Icon(CategoryIcon().getIcon(data[index].slug!), size: 40, color: Colors.amber,),
                        Text(data[index].name!),
                      ]
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          );
        }
        return CircularProgressIndicator();
      })
    ]);
  }
}
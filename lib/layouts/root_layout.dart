import 'package:boutique/widgets/shared/appbar_widget.dart';
import 'package:boutique/widgets/shared/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootLayout extends StatelessWidget {
  final Widget screen;
  const RootLayout({super.key, required this.screen});

  // Widget _getLeftButton(BuildContext context){
  //   return context.canPop() ? IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)) : DrawerWidget();
  // }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppbarWidget(),
      drawer: context.canPop() ? null : DrawerWidget(),
      body: SingleChildScrollView(child: screen),
    );
  }
}
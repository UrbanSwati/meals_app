import 'package:flutter/material.dart';
import '../dummy-data.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryTitle = routeArgs['title'];
    final String categoryId = routeArgs['id'];
    final categoriesMeal = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(categoriesMeal[index].title);
          },
          itemCount: categoriesMeal.length,
        ),
      ),
    );
  }
}

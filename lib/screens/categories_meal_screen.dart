import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../widgets/meal_item.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryTitle = routeArgs['title'];
    final String categoryId = routeArgs['id'];
    final categoriesMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            final meal = categoriesMeal[index];

            return MealItem(
              id: meal.id,
              title: meal.title,
              duration: meal.duration,
              complexity: meal.complexity,
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
            );
          },
          itemCount: categoriesMeal.length,
        ),
      ),
    );
  }
}

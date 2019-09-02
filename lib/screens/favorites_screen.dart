import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(child: Text('Favorites Screen'));
    } else {
      return Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            final meal = favoriteMeals[index];

            return MealItem(
              id: meal.id,
              title: meal.title,
              duration: meal.duration,
              complexity: meal.complexity,
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
            );
          },
          itemCount: favoriteMeals.length,
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> avalableMeals;

  CategoriesMealScreen(this.avalableMeals);

  @override
  _CategoriesMealScreenState createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  bool _loadedInitData = false;
  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final String categoryId = routeArgs['id'];
      displayedMeal = widget.avalableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }
  
  void _removeMeal(String id) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            final meal = displayedMeal[index];

            return MealItem(
              removeItem: _removeMeal,
              id: meal.id,
              title: meal.title,
              duration: meal.duration,
              complexity: meal.complexity,
              imageUrl: meal.imageUrl,
              affordability: meal.affordability,
            );
          },
          itemCount: displayedMeal.length,
        ),
      ),
    );
  }
}

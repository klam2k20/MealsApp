import 'package:flutter/material.dart';

import '../widgets/recipeItem.dart';
import '../models/recipe.dart';

class RecipeScreen extends StatelessWidget {
  static const routeName = '/RecipeScreen';
  final List<Recipe> _availableRecipes;

  const RecipeScreen(this._availableRecipes);

  
  @override
  Widget build(BuildContext context) {
    //Get args passed in from CategoryItem when selected
    final route = ModalRoute.of(context);
    if (route == null) return SizedBox.shrink();
    final routeArgs = route.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryID = routeArgs['id'];
    final categoryRecipes = _availableRecipes.where((recipe) {
      return recipe.categories.contains(categoryID);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final recipe = categoryRecipes[index];
            return RecipeItem(
                id: recipe.id,
                title: recipe.title,
                imageUrl: recipe.imageUrl,
                duration: recipe.duration,
                complexity: recipe.complexity,
                affordability: recipe.affordability);
          },
          itemCount: categoryRecipes.length,
        ));
  }
}

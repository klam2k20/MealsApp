import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../widgets/recipeItem.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> _favoriteRecipes;

  // ignore: use_key_in_widget_constructors
  const FavoritesScreen(this._favoriteRecipes);

  @override
  Widget build(BuildContext context) {
    if (_favoriteRecipes.isEmpty) {
      return Center(
        child: Text(
          'Add some favorites!',
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }
    return ListView.builder(
        itemBuilder: (context, index) {
          final recipe = _favoriteRecipes[index];
          return RecipeItem(
              id: recipe.id,
              title: recipe.title,
              imageUrl: recipe.imageUrl,
              duration: recipe.duration,
              complexity: recipe.complexity,
              affordability: recipe.affordability);
        },
        itemCount: _favoriteRecipes.length);
  }
}

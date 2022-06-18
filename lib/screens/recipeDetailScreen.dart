import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = '/RecipeDetailScreen';
 
  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if(route == null) return SizedBox.shrink();
    final recipeID = route.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(recipeID)),
      body: Text('This meal - $recipeID'),
    );
  }
}

import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get args passed in from CategoryItem when selected
    final route = ModalRoute.of(context);
    if(route == null) return SizedBox.shrink();
    final routeArgs = route.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('The Recipes for $categoryTitle!'),
      ),
    );
  }
}

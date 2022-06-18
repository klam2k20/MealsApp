import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../screens/recipeDetailScreen.dart';

class RecipeItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const RecipeItem(
      {
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.duration,
        required this.complexity,
        required this.affordability
      });

  String get complexityString {
    switch (complexity) {
      case Complexity.easy:
        return 'Easy';
      case Complexity.medium:
        return 'Medium';
      default:
        return 'Hard';
    }
  }

  String get affordabilityString {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.reasonnable:
        return 'Reasonable';
      default:
        return 'Pricey';
    }
  }
  void _selectRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(RecipeDetailScreen.routeName, arguments: id,);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectRecipe(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      title,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  recipeInfo(Icons.schedule, '$duration min'),
                  recipeInfo(Icons.work, complexityString),
                  recipeInfo(Icons.attach_money, affordabilityString)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class recipeInfo extends StatelessWidget {
  final IconData  icon;
  final String text;

  const recipeInfo(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5,),
        Text(text),
      ],
    );
  }
}

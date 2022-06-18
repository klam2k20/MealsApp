import 'package:flutter/material.dart';

import '../dummyData.dart';
import '../widgets/categoryItem.dart';

class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliRecipes'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //Min width of a tile
            maxCrossAxisExtent: 200,
            //Height/width ratio
            childAspectRatio: 3 / 2,
            //Spacing for direction not scrolling in
            crossAxisSpacing: 20,
            //Spacing for direction scrolling in
            mainAxisSpacing: 20),
        children: dummyCategories.map((category) {
          return CategoryItem(
            category.id,
            category.title,
            category.bgColor,
          );
        }).toList(),
      ),
    );
  }
}

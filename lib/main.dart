import 'package:flutter/material.dart';

import './screens/tabsScreen.dart';
import './screens/recipeScreen.dart';
import './screens/categoryScreen.dart';
import './screens/recipeDetailScreen.dart';
import './screens/filtersScreen.dart';
import './dummyData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _availableRecipes = dummyRecipes;
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  void _updateFilters(Map<String, bool> updatedFilters) {
    setState(() {
      _filters = updatedFilters;
      _availableRecipes = dummyRecipes.where((recipe) {
        if (!recipe.isGlutenFree && _filters['gluten']!) {
          return false;
        }
        if (!recipe.isLactoseFree && _filters['lactose']!) {
          return false;
        }
        if (!recipe.isVegetarian && _filters['vegetarian']!) {
          return false;
        }
        if (!recipe.isVegan && _filters['vegan']!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                  fontSize: 20, fontFamily: 'RobotoCondensed'))),
      // home: CategoryScreen(),
      routes: {
        '/': (context) => TabsScreen(),
        RecipeScreen.routeName: (context) => RecipeScreen(_availableRecipes),
        RecipeDetailScreen.routeName: (context) => RecipeDetailScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _updateFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoryScreen());
      },
    );
  }
}

import 'dart:ui';

import 'package:Recipe_app/screens/recipeScreen.dart';
import 'package:flutter/material.dart';

import 'screens/recipeScreen.dart';
import 'screens/categoryScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed'
                )
              )),
      // home: CategoryScreen(),
      routes: {
        '/':(context) => CategoryScreen(),
        RecipeScreen.routeName: (context) => RecipeScreen(),
      },
    );
  }
}

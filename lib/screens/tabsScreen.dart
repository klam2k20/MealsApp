import 'package:flutter/material.dart';

import './categoryScreen.dart';
import './favoritesScreen.dart';
import '../widgets/MainDrawer.dart';
import '../models/recipe.dart';
class TabsScreen extends StatefulWidget {
  final List<Recipe> _favoriteRecipes;

  const TabsScreen(this._favoriteRecipes);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screens = [];
  var _selectScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  void initState() {
    _screens = [
    {'screen': CategoryScreen(), 'title': 'Categories'},
    {'screen': FavoritesScreen(widget._favoriteRecipes), 'title': 'Favorites'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectScreenIndex]['title'] as String),
        ),
        drawer: MainDrawer(),
        body: _screens[_selectScreenIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectScreenIndex,
          onTap: _selectScreen,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.favorite),
              label: 'Favorites',
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

import './categoryScreen.dart';
import './favoritesScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  final List<Map<String, Object>> _screens = [
    {'screen': CategoryScreen(), 'title': 'Categories'},
    {'screen': FavoritesScreen(), 'title': 'Favorites'},
    ];
  var _selectScreenIndex = 0;
  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectScreenIndex]['title'] as String),
        ),
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
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            )
          ],
        ));
  }
}

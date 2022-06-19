import 'package:flutter/material.dart';

import './categoryScreen.dart';
import './favoritesScreen.dart';
class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DeliMeals'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: 'Favorites',
            ),
          ]),
        ),
        body: TabBarView(
          children: [CategoryScreen(), FavoritesScreen()],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../screens/filtersScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildDrawerLink(
      IconData icon, String title, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking It Up!',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildDrawerLink(
            Icons.restaurant_menu,
            'Categories',
            () => Navigator.of(context).pushNamed('/'),
          ),
          _buildDrawerLink(
            Icons.settings,
            'Filters',
            () => Navigator.of(context).pushNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}

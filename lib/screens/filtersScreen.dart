import 'package:flutter/material.dart';

import '../widgets/MainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> _filters;
  final Function _updateFilters;

  // ignore: use_key_in_widget_constructors
  const FiltersScreen(this._filters, this._updateFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  @override
  void didChangeDependencies() {
    _isGlutenFree = widget._filters['gluten']!;
    _isLactoseFree = widget._filters['lactose']!;
    _isVegetarian = widget._filters['vegetarian']!;
    _isVegan = widget._filters['vegan']!;
    super.didChangeDependencies();
  }

  Widget _buildSwitchTile(String title, String subtitle, bool currentValue,
      Function(bool) switchHandler) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: switchHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              Map<String, bool> updatedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegetarian': _isVegetarian,
                'vegan': _isVegan
              };
              widget._updateFilters(updatedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Text('Adjust Your Meal Selection:',
              style: Theme.of(context).textTheme.headline6),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchTile(
                'Gluten-free',
                'Only include gluten-free recipes',
                _isGlutenFree,
                (newValue) => setState(() {
                  _isGlutenFree = newValue;
                }),
              ),
              _buildSwitchTile(
                'Lactose-free',
                'Only include lactose-free recipes',
                _isLactoseFree,
                (newValue) => setState(() {
                  _isLactoseFree = newValue;
                }),
              ),
              _buildSwitchTile(
                'Vegetarian',
                'Only include vegetarian recipes',
                _isVegetarian,
                (newValue) => setState(() {
                  _isVegetarian = newValue;
                }),
              ),
              _buildSwitchTile(
                'Vegan',
                'Only include vegan recipes',
                _isVegan,
                (newValue) => setState(() {
                  _isVegan = newValue;
                }),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

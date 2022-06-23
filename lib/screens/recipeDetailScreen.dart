import 'package:flutter/material.dart';
import '../dummyData.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = '/RecipeDetailScreen';

  final Function _toggleFavoriteRecipe;
  final Function _isFavorite;

  const RecipeDetailScreen(this._toggleFavoriteRecipe, this._isFavorite);

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null) return const SizedBox.shrink();
    final recipeID = route.settings.arguments as String;
    final selectedRecipe =
        dummyRecipes.firstWhere((recipe) => recipe.id == recipeID);
    final appBar = AppBar(title: Text(selectedRecipe.title));

    Widget _buildSubTitle(BuildContext context, String text) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget _buildListView({required int flex, required Widget child}) {
      return Flexible(
        flex: flex,
        fit: FlexFit.tight,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(15),
          ),
          width: 300,
          child: child,
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Column(children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Image.network(
              width: double.infinity,
              selectedRecipe.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          _buildSubTitle(context, 'Ingredients'),
          _buildListView(
            flex: 1,
            child: ListView.builder(
              itemBuilder: (context, index) => Text(
                  selectedRecipe.ingredients[index],
                  style: Theme.of(context).textTheme.bodyText1),
              itemCount: selectedRecipe.ingredients.length,
            ),
          ),
          _buildSubTitle(context, 'Steps'),
          _buildListView(
            flex: 2,
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedRecipe.steps[index],
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  const Divider(color: Colors.black54),
                ],
              ),
              itemCount: selectedRecipe.steps.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isFavorite(recipeID)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        onPressed: () => _toggleFavoriteRecipe(recipeID),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'detail_screen.dart';

class Recipe {
  final String name;
  final List<String> ingredients;
  final String instructions;

  const Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List<Recipe> recipes = const [
    Recipe(
      name: 'item1',
      ingredients: [
        'igredient1',
        'igredient2',
      ],
      instructions:
          'Instructions',
    ),
    Recipe(
      name: 'item2',
      ingredients: [
        'igredient1',
        'igredient2',
      ],
      instructions:
        'Instructions',
    ),
    Recipe(
      name: 'item3',
      ingredients: [
        'igredient1',
        'igredient2',
      ],
      instructions:
        'Instructions',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Book'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: Text(recipe.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

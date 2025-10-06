import 'package:flutter/material.dart';
import 'home_screen.dart';

class DetailScreen extends StatelessWidget {
  final Recipe recipe;

  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            ...recipe.ingredients.map(
              (ingredient) => ListTile(
                leading: const Icon(Icons.circle, size: 8),
                title: Text(ingredient),
                dense: true,
                visualDensity: VisualDensity.compact,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Instructions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            ..._buildInstructionsList(recipe.instructions),
          ],
        ),
      ),
    );
  }
  List<Widget> _buildInstructionsList(String instructionsText) {
    final steps = instructionsText.split('\n');

    return List.generate(steps.length, (index) {
      return ListTile(
        leading: CircleAvatar(
          radius: 12,
          child: Text('${index + 1}', style: const TextStyle(fontSize: 12)),
        ),
        title: Text(steps[index]),
        contentPadding: EdgeInsets.zero,
        dense: true,
      );
    });
  }
}

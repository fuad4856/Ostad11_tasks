import 'package:flutter/material.dart';
import 'dart:convert';

// Recipe model
class Recipe {
	final String title;
	final String description;
	final List<String> ingredients;

	Recipe({
		required this.title,
		required this.description,
		required this.ingredients,
	});

	factory Recipe.fromJson(Map<String, dynamic> json) {
		return Recipe(
			title: json['title'],
			description: json['description'],
			ingredients: List<String>.from(json['ingredients'] ?? json['Ingredients'] ?? []),
		);
	}
}

// Sample JSON string
const String recipesJson = '''
{
	"recipes": [
		{
			"title": "Pasta Carbonara",
			"description": "Creamy pasta dish with bacon and cheese.",
			"ingredients": ["spaghetti", "bacon", "egg", "cheese"]
		},
		{
			"title": "Caprese Salad",
			"description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
			"ingredients": ["tomatoes", "mozzarella", "basil"]
		},
		{
			"title": "Banana Smoothie",
			"description": "Healthy and creamy smoothie with bananas and milk.",
			"ingredients": ["bananas", "milk"]
		},
		{
			"title": "Chicken Stir-Fry",
			"description": "Quick and flavorful stir-fried chicken with vegetables.",
			"ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
		},
		{
			"title": "Grilled Salmon",
			"description": "Delicious grilled salmon with lemon and herbs.",
			"ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
		},
		{
			"title": "Vegetable Curry",
			"description": "Spicy and aromatic vegetable curry.",
			"ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
		},
		{
			"title": "Berry Parfait",
			"description": "Layered dessert with fresh berries and yogurt.",
			"ingredients": ["berries", "yogurt", "granola"]
		}
	]
}
''';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});
	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		home: const RecipeListScreen(),
	);
	}
}

class RecipeListScreen extends StatelessWidget {
	const RecipeListScreen({super.key});

	List<Recipe> parseRecipes() {
		final Map<String, dynamic> data = json.decode(recipesJson);
		final List<dynamic> recipesList = data['recipes'];
		return recipesList.map((json) => Recipe.fromJson(json)).toList();
	}

	@override
	Widget build(BuildContext context) {
		final recipes = parseRecipes();
		return Scaffold(
			appBar: AppBar(title: const Text('Food Recipes'),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      backgroundColor: Colors.blue,
      ),
			body: ListView.builder(
				itemCount: recipes.length,
				itemBuilder: (context, index) {
					final recipe = recipes[index];
					return ListTile(
						leading: const Icon(Icons.restaurant_menu_outlined),
						title: Text(recipe.title, style: const TextStyle(fontWeight: FontWeight.bold)),
						subtitle: Text(recipe.description),
					);
				},
			),
		);
	}
}

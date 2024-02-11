import 'package:recipes_app/utils/class.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class Data {
  // static const String bookmarkedRecipesKey = 'bookmarkedRecipes';

  static List<Recipe> recipes = [
    Recipe(
        id: '1',
        title: 'Mo:Mo',
        imageUrl:
            'https://images.unsplash.com/photo-1496116218417-1a781b1c416c?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
        nutrients: [
          Nutrients(name: 'Calories', weight: '200', percent: 0.7),
          Nutrients(name: 'Protein', weight: '10gm', percent: 0.5),
          Nutrients(name: 'Carb', weight: '50gm', percent: 0.9),
        ],
        steps: [
          'Gather the ingredients.',
          'Pull a double shot of espresso into a cappuccino cup.',
          'Foam the milk to double its original volume.'
              'Top the espresso with foamed milk right after foaming. When initially poured, cappuccinos are only espresso and foam, but the liquid milk quickly settles out of the foam to create the (roughly) equal parts foam, steamed milk, and espresso for which cappuccino is known.',
          'Serve immediately.'
        ],
        ingredients: [
          '2 shots espresso (a double shot)',
          '4 ounces milk'
        ],
        createdBy: 'mihret@gmail.com',
        ),
    Recipe(
        id: '2',
        title: 'Cappuccino',
        imageUrl:
            'https://images.unsplash.com/photo-1444418185997-1145401101e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1391&q=80',
        nutrients: [
          Nutrients(name: 'Calories', weight: '200', percent: 0.7),
          Nutrients(name: 'Protein', weight: '10gm', percent: 0.5),
          Nutrients(name: 'Carb', weight: '50gm', percent: 0.9),
        ],
        steps: [
          'Gather the ingredients.',
          'Pull a double shot of espresso into a cappuccino cup.',
          'Foam the milk to double its original volume.'
              'Top the espresso with foamed milk right after foaming. When initially poured, cappuccinos are only espresso and foam, but the liquid milk quickly settles out of the foam to create the (roughly) equal parts foam, steamed milk, and espresso for which cappuccino is known.',
          'Serve immediately.'
        ],
        ingredients: [
          '2 shots espresso (a double shot)',
          '4 ounces milk'
        ],
        createdBy: 'mihret@gmail.com',
        ),
    Recipe(
        id: '3',
        title: 'Spaghetti',
        imageUrl:
            'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
        nutrients: [
          Nutrients(name: 'Calories', weight: '100', percent: 0.2),
          Nutrients(name: 'Protein', weight: '10gm', percent: 0.7),
          Nutrients(name: 'Carb', weight: '50gm', percent: 0.6),
          Nutrients(name: 'Fat', weight: '10gm', percent: 0.3),
        ],
        steps: [
          'Gather the ingredients.',
          'Pull a double shot of espresso into a cappuccino cup.',
          'Foam the milk to double its original volume.'
              'Top the espresso with foamed milk right after foaming. When initially poured, cappuccinos are only espresso and foam, but the liquid milk quickly settles out of the foam to create the (roughly) equal parts foam, steamed milk, and espresso for which cappuccino is known.',
          'Serve immediately.'
        ],
        ingredients: [
          '2 shots espresso (a double shot)',
          '4 ounces milk'
        ],
        createdBy: 'mihret@gmail.com',
        ),
    Recipe(
        id: '4',
        title: 'Pizza',
        imageUrl:
            'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
        nutrients: [
          Nutrients(name: 'Calories', weight: '200', percent: 0.7),
          Nutrients(name: 'Protein', weight: '10gm', percent: 0.5),
          Nutrients(name: 'Carb', weight: '50gm', percent: 0.9),
        ],
        steps: [
          'Gather the ingredients.',
          'Pull a double shot of espresso into a cappuccino cup.',
          'Foam the milk to double its original volume.'
              'Top the espresso with foamed milk right after foaming. When initially poured, cappuccinos are only espresso and foam, but the liquid milk quickly settles out of the foam to create the (roughly) equal parts foam, steamed milk, and espresso for which cappuccino is known.',
          'Serve immediately.'
        ],
        ingredients: [
          '2 shots espresso (a double shot)',
          '4 ounces milk'
        ],
        createdBy: 'mihret@gmail.com',
        ),
  ];

  static void addRecipie(Recipe recipe){
    recipes.add(recipe);
  }

   // Add a method to edit a recipe
  static void editRecipe(String id, Recipe updatedRecipe) {
    final index = recipes.indexWhere((recipe) => recipe.id == id);
    if (index != -1) {
      recipes[index] = updatedRecipe;
    }
  }

  // Add a method to delete a recipe by its ID
  static void deleteRecipe(String id) {
    recipes.removeWhere((recipe) => recipe.id == id);
  }

  // Add a method to search for recipes by title
  static List<Recipe> searchRecipes(String query) {
    return recipes
        .where((recipe) =>
            recipe.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  //  // Add a method to search for a recipe by its ID
  // Recipe? getRecipeById(String id) {
  //   return recipes.firstWhere((recipe) => recipe.id == id, orElse: () => null);
  // }
  static const String bookmarkedRecipesKey = 'bookmarkedRecipes';

  static void saveBookmarkedRecipes() {
    final List<String> bookmarkedRecipeIds = recipes
        .where((recipe) => recipe.isBookmarked)
        .map((recipe) => recipe.id)
        .toList();

    // Save the list of bookmarked recipe IDs to SharedPreferences
    // You may need to handle serialization and deserialization of the list
    // based on your requirements.
    // Here, I'm using json.encode and json.decode for simplicity.
    final String jsonString = json.encode(bookmarkedRecipeIds);
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(bookmarkedRecipesKey, jsonString);
    });
  }

  static void toggleBookmarkStatus(Recipe recipe) {
    recipe.isBookmarked = !recipe.isBookmarked;
    saveBookmarkedRecipes();
  }

  static Future<List<Recipe>> getBookmarkedRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonString = prefs.getString(bookmarkedRecipesKey) ?? '[]';
    final List<String> bookmarkedRecipeIds =
        List<String>.from(json.decode(jsonString));

    return recipes
        .where((recipe) => bookmarkedRecipeIds.contains(recipe.id))
        .toList();
  }




}

class Nutrients {
  String name;
  String weight;
  double percent;
  Nutrients({required this.name, required this.weight, required this.percent});
}

class Recipe {
  String id, imageUrl, title;
  List<String> steps;
  List<String> ingredients;
  List<Nutrients> nutrients;
  String createdBy;
  bool isBookmarked;
  Recipe(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.steps,
      required this.ingredients,
      required this.nutrients,
      required this.createdBy,
      this.isBookmarked = false,
      });
}

class User{
  String id;
  String name;
  String email;
  String password;

  User({required this.id ,required this.name, required this.email, required this.password});
}
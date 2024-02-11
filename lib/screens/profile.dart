import 'package:flutter/material.dart';
import 'package:recipes_app/screens/details.dart';
import 'package:recipes_app/utils/class.dart';
import 'package:recipes_app/utils/data.dart';
import 'package:recipes_app/utils/userData.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Recipe> myRecipes = Data.recipes
        .where((value) => value.createdBy == UserData.CurrentUser)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fvectors%2Fblank-profile-picture-mystery-man-973460%2F&psig=AOvVaw3_BM8jZbHB5LBeWUIxBFOB&ust=1707707666390000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOjevcGpooQDFQAAAAAdAAAAABAE"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  UserData.CurrentUser,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "My Recipies",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: myRecipes.length,
                itemBuilder: (context, index) =>
                    // Card(child: Text(Data.recipes[index].title)),
                    // )
                    RecipeTile(
                  recipe: myRecipes[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeTile extends StatelessWidget {
  final Recipe recipe;
  const RecipeTile({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(recipe: recipe),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2)),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              recipe.title,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

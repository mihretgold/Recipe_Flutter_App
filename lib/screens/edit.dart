import 'package:flutter/material.dart';
import 'package:recipes_app/main.dart';
import 'package:recipes_app/screens/details.dart';
import 'package:recipes_app/screens/home.dart';
import 'package:recipes_app/utils/class.dart';
import 'package:recipes_app/utils/data.dart';
import 'dart:math';

import 'package:recipes_app/utils/userData.dart';

List<String> stepsGlobal = [];
List<String> ingGlobal = [];
List<Nutrients> nutGlobal = [];

class EditPage extends StatelessWidget {
  final String index;
  final String title;
  final String imgUrl;
  final List<String> stepsList;
  final List<String> ingList;
  final List<Nutrients> nutList;
  const EditPage(
      {required this.index,
      required this.title,
      required this.imgUrl,
      required this.stepsList,
      required this.ingList,
      required this.nutList,
      super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController imgUrlController = TextEditingController();
    TextEditingController stepController = TextEditingController();
    TextEditingController ingridentController = TextEditingController();
    TextEditingController nutrientNameController = TextEditingController();
    TextEditingController nutrientWeightController = TextEditingController();
    TextEditingController nutrientPercentController = TextEditingController();
    titleController.text = title;
    imgUrlController.text = imgUrl;
    List<String> steps = stepsList;
    List<String> ing = ingList;
    List<Nutrients> nut = nutList;

    final _formKey = GlobalKey<FormState>();
    var body = Container(
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 15, 22),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  CustomTextField(title: 'Title', controller: titleController),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'Image URL',
                    controller: imgUrlController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TableList(
                    choice: steps,
                    controller: stepController,
                    title: "Steps",
                    pick: 1,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TableList(
                    choice: ing,
                    controller: ingridentController,
                    title: "Ingrdient",
                    pick: 2,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Nutrients",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  NutrientsList(
                      controller1: nutrientNameController,
                      controller2: nutrientWeightController,
                      controller3: nutrientPercentController,
                      choice: nut),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        editRecipe(
                          index,
                          titleController.text,
                          imgUrlController.text,
                          stepsGlobal,
                          ingGlobal,
                          nutGlobal,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Recipe edited successfully'),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: const Text("Finish"),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: const Text('Edit Recipes'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: body,
    );
  }

  void editRecipe(String id, String title, String imageUrl, List<String> steps,
      List<String> ingredients, List<Nutrients> nutrients) {
    Recipe recipe = Recipe(
      id: id,
      title: title,
      imageUrl: imageUrl,
      steps: steps,
      ingredients: ingredients,
      nutrients: nutrients,
      createdBy: UserData.CurrentUser,
    );
    // Data.recipes.add(recipe);
    Data.editRecipe(id, recipe);
  }
}

class CustomTextField extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const CustomTextField(
      {required this.controller, required this.title, super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          cursorColor: Theme.of(context).colorScheme.onPrimary,
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            // color
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(
                color: Color(0XFFD9DADB),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey, // Set the border color to grey
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TableList extends StatefulWidget {
  final String title;
  final List<String> choice;
  int pick;
  TextEditingController controller;
  TableList(
      {required this.pick,
      required this.title,
      required this.controller,
      required this.choice,
      super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          title: widget.title,
          controller: widget.controller,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              widget.choice.add(widget.controller.text);
              widget.controller = TextEditingController();
              if (widget.pick == 1) {
                stepsGlobal = widget.choice;
              } else {
                ingGlobal = widget.choice;
              }
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          child: const Text("Add"),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 43),
                child: Text(
                  "List",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 0,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 194, 241, 199),
              ),
              child: widget.choice.isEmpty
                  ? const SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: Center(child: Text('Empty')))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.choice.length,
                      itemBuilder: (context, index) {
                        String key = widget.choice[index];
                        // String questionUrl = widget.ch[index].url!;
                        key = key.toUpperCase();

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(43, 0, 10, 0),
                              child: Row(
                                children: [
                                  Text(
                                    '${(index + 1)}. $key',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                  const Spacer(),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.delete_outline_rounded),
                                    onPressed: () {
                                      setState(() {
                                        widget.choice
                                            .remove(widget.choice[index]);
                                        if (widget.pick == 1) {
                                          stepsGlobal = widget.choice;
                                        } else {
                                          ingGlobal = widget.choice;
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            if (index < widget.choice.length - 1)
                              const Divider(), // Add a Divider if not the last item
                          ],
                        );
                      },
                    ),
            )
          ],
        ),
      ],
    );
  }
}

class NutrientsList extends StatefulWidget {
  final List<Nutrients> choice;
  TextEditingController controller1;
  TextEditingController controller2;
  TextEditingController controller3;
  NutrientsList(
      {required this.controller1,
      required this.controller2,
      required this.controller3,
      required this.choice,
      super.key});

  @override
  State<NutrientsList> createState() => _NutrientListState();
}

class _NutrientListState extends State<NutrientsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(title: 'Name', controller: widget.controller1),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          title: 'Weight',
          controller: widget.controller2,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(title: 'Percent', controller: widget.controller3),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              double percent = double.parse(widget.controller3.text);
              Nutrients nutrient = Nutrients(
                  name: widget.controller1.text,
                  weight: widget.controller2.text,
                  percent: percent);
              widget.choice.add(nutrient);
              widget.controller1 = TextEditingController();
              widget.controller2 = TextEditingController();
              widget.controller3 = TextEditingController();
              nutGlobal = widget.choice;
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          child: const Text("Add"),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 43),
                child: Text(
                  "List",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 0,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 194, 241, 199),
              ),
              child: widget.choice.isEmpty
                  ? const SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: Center(child: Text('Empty')))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.choice.length,
                      itemBuilder: (context, index) {
                        String key = widget.choice[index].name;
                        String weight = widget.choice[index].weight;
                        String percent =
                            widget.choice[index].percent.toString();
                        key = key.toUpperCase();

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(43, 0, 10, 0),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment,
                                children: [
                                  // const Spacer(),
                                  Text(
                                    '${(index + 1)}. $key',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  const Spacer(),
                                  Text(
                                    weight,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  const Spacer(),
                                  Text(
                                    percent,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   width: 20,
                                  // ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.delete_outline_rounded),
                                    onPressed: () {
                                      setState(() {
                                        widget.choice
                                            .remove(widget.choice[index]);
                                        nutGlobal = widget.choice;
                                      });
                                    },
                                  ),
                                  // const Spacer(),
                                ],
                              ),
                            ),
                            if (index < widget.choice.length - 1)
                              const Divider(), // Add a Divider if not the last item
                          ],
                        );
                      },
                    ),
            )
          ],
        ),
      ],
    );
  }
}

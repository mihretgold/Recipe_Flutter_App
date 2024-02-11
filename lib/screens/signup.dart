import 'package:flutter/material.dart';
import 'package:recipes_app/main.dart';
import 'package:recipes_app/screens/login.dart';
import 'package:recipes_app/utils/class.dart';

List<String> stepsGlobal = [];
List<String> ingGlobal = [];
List<Nutrients> nutGlobal = [];

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController signUpNameController = TextEditingController();
    TextEditingController signUpEmailController = TextEditingController();
    TextEditingController signUpPasswordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    var body = Center(
      child: Container(
        // height: double.infinity,
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 15, 22),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    CustomTextField(
                        title: 'Name', controller: signUpNameController),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: 'Email',
                      controller: signUpEmailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: 'Password',
                      controller: signUpPasswordController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Recipe created successfully'),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        child: const Text("Signup"),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: body,
    );
  }

  void createUser(String name, String email, String password) {}
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

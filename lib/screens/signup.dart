import 'package:flutter/material.dart';
import 'package:recipes_app/main.dart';
import 'package:recipes_app/screens/login.dart';
import 'package:recipes_app/utils/class.dart';
import 'package:recipes_app/utils/userData.dart';

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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/recipe.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
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
                          User? user = UserData.signup(
                              signUpNameController.text,
                              signUpEmailController.text,
                              signUpPasswordController.text);

                          if (user != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Signed Up successfully'),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Signed Up unsuccessfull! Please Try again'),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ));
                      },
                      child: Text(
                        "Already have an account? SignIn",
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
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
          // cursorColor: Theme.of(context).colorScheme.onPrimary,
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

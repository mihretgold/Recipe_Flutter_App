import 'package:flutter/material.dart';
import 'package:recipes_app/main.dart';
import 'package:recipes_app/screens/home.dart';
import 'package:recipes_app/screens/signup.dart';
import 'package:recipes_app/utils/class.dart';
import 'package:recipes_app/utils/userData.dart';

List<String> stepsGlobal = [];
List<String> ingGlobal = [];
List<Nutrients> nutGlobal = [];

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController loginEmailController = TextEditingController();
    TextEditingController loginPasswordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    var body = Center(
      child: Container(
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
                          "Login",
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      title: 'Email',
                      controller: loginEmailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: 'Password',
                      controller: loginPasswordController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          User? user = UserData.login(loginEmailController.text,
                              loginPasswordController.text);
                          print(user);
                          if (user != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Succesfully Looged In!!!'),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Incorrect Password ot Email Please try again'),
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
                        child: const Text("Login"),
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
                              builder: (context) => const Signup(),
                            ));
                      },
                      child: Text(
                        "Dont't have an account? SignUp",
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

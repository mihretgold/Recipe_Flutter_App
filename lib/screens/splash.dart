import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipes_app/screens/signup.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToLogin() {
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Signup(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    navigateToLogin();
    return Scaffold(
      body: Container(
        width: double.infinity,
        //color: Theme.of(context).primaryColor,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.primary,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/recipe.png",
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Recipie App",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Lottie.asset('assets/lottie/Animation1.json'),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Welcome!!! Let's Get Cooking 🍜",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
      ),
    );
  }
}

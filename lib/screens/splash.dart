import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipes_app/screens/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToLogin() {
    Timer(const Duration(seconds: 3), () {
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
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.primary,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("Recipie App")]),
      ),
    );
  }
}

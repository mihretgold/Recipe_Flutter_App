import 'package:flutter/material.dart';
import 'package:recipes_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 0, 0, 139), // Darker blue
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Keep the swatch
          accentColor: const Color.fromARGB(255, 0, 0, 205), // Darker blue for accent
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
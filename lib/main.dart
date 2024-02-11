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
      // debugShowCheckedModeBanner: false,
      title: 'Recipes App',
      theme: ThemeData(
        primaryColor: const Color(0xff263341),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              Colors.green, // Adjust this to your desired primary color
          accentColor:
              const Color(0xff8DB646), // This is now the secondary color
        ),
        // useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

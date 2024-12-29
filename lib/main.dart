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
        primaryColor: const Color.fromARGB(255, 32, 28, 56),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              Colors.blue, // Adjust this to your desired primary color
          accentColor: Colors.lightBlue, // This is now the secondary color
        ),
        // useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

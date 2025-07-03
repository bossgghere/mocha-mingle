import 'package:coffee_ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffee_ui/pages/home.dart'; // Import your Home screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      // 👇 Directly launching Home screen
      home: const SplashScreen(), // Set to false if user is not admin
    );
  }
}

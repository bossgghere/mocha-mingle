import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:coffee_ui/pages/home.dart'; // ✅ Import Home

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(), // 👈 choose true/false
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Mocha\nMingle',
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  fontSize: 50,
                  color: Colors.orange,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              const Icon(
                Icons.coffee,
                size: 70,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

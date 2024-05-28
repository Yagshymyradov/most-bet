import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MostBetApp());
}

class MostBetApp extends StatelessWidget {
  const MostBetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(const MostBetApp());
}

class MostBetApp extends StatelessWidget {
  const MostBetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const BelesApp());
}

class BelesApp extends StatelessWidget {
  const BelesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BELES App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}

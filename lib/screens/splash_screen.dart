import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    // Simulate loading time
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using an Icon to simulate the triangle logo from the image for MVP
            const Icon(
              Icons.change_history, // Triangle-like icon
              size: 100,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(height: 16),
            const Text(
              'BELES',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
                letterSpacing: 2,
              ),
            ),
            const Text(
              'HOLDING',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryBlue,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

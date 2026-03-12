import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'sms_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  void _onContinue() {
    if (_phoneController.text.length >= 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SmsVerificationScreen(
            phoneNumber: _phoneController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Кіру үшін дұрыс телефон нөмірін енгізіңіз')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              // Header
              const Icon(
                Icons.account_circle_outlined,
                size: 80,
                color: AppColors.primaryBlue,
              ),
              const SizedBox(height: 24),
              const Text(
                'BELES-ке қош келдіңіз!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Жалғастыру үшін телефон нөміріңізді енгізіңіз',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              
              // Input field
              const Text(
                'Телефон нөмірі',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '+7 (700) 000 00 00',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              
              const Spacer(),
              
              // Continue button
              ElevatedButton(
                onPressed: _onContinue,
                child: const Text('Жалғастыру'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}

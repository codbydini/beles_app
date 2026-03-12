import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'home_screen.dart';

class SmsVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const SmsVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<SmsVerificationScreen> createState() => _SmsVerificationScreenState();
}

class _SmsVerificationScreenState extends State<SmsVerificationScreen> {
  final TextEditingController _codeController = TextEditingController();

  void _onVerify() {
    if (_codeController.text.length == 4) { // Dummy check
      // For now, substitute a placeholder. Home screen comes next.
       Navigator.pushAndRemoveUntil(
         context,
         MaterialPageRoute(builder: (context) => const HomeScreen()),
         (route) => false,
       );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Толық 4 санды кодты енгізіңіз')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text('Растау', style: TextStyle(color: AppColors.primaryBlue)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              
              Text(
                'SMS код жіберілді',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Код мына нөмірге жіберілді:\n${widget.phoneNumber}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              
              // Input field for SMS
              TextField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 4,
                style: const TextStyle(fontSize: 24, letterSpacing: 8, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  hintText: '0000',
                  counterText: '', // Hide length counter
                ),
              ),
              
              const Spacer(),
              
              ElevatedButton(
                onPressed: _onVerify,
                child: const Text('Растау және Кіру'),
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
    _codeController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _onTransfer() {
    if (_phoneController.text.isNotEmpty && _amountController.text.isNotEmpty) {
      // Show success dialog for MVP
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Аударым сәтті өтті!'),
          content: Text('${_phoneController.text} нөміріне ${_amountController.text} ₸ жіберілді.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to Home
              },
              child: const Text('Жақсы'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Барлық жолдарды толтырыңыз')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Аударым жасау'),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Кімге аударасыз?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '+7 (70X) XXX XX XX',
                  prefixIcon: Icon(Icons.contact_phone_outlined),
                ),
              ),
              const SizedBox(height: 32),
              
              const Text(
                'Сомасы (₸)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
             ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  hintText: '0',
                  prefixIcon: Icon(Icons.attach_money),
                ),
              ),
              
              const Spacer(),
              
              ElevatedButton(
                onPressed: _onTransfer,
                child: const Text('Аудару'),
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
    _amountController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Mock user data for UI
  final String _userName = 'Дінмұхаммед Ахмет';
  final String _phoneNumber = '+7 (705) 123 45 67';
  final String _userId = 'ID: 8492 4010';

  // Demo toggle (Set to false to show Guest view, true for Logged In)
  // For the superapp lazy login demo, we assume the user is a Guest until they log in.
  // Since we don't have global state management (like Provider) in this MVP,
  // we will just show the Guest View for this demo.
  final bool _isGuest = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
      ),
      body: _isGuest ? _buildGuestView(context) : _buildLoggedInView(context),
    );
  }

  Widget _buildGuestView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 100, color: AppColors.secondaryBlue),
            const SizedBox(height: 24),
            const Text(
              'Жүйеге кіріңіз',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 16),
            const Text(
              'Толық мүмкіндіктерді пайдалану, қызметтерге тапсырыс беру және пәтер брондау үшін тіркеліңіз немесе кіріңіз.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Кіру / Тіркелу'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoggedInView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 32),
          // Avatar
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.secondaryBlue,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          // User Info
          Text(_userName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          Text(_userId, style: const TextStyle(fontSize: 16, color: AppColors.textSecondary)),
          
          const SizedBox(height: 32),
          
          // Details List
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                _buildProfileRow(Icons.phone_outlined, 'Телефон нөмірі', _phoneNumber),
                const Divider(height: 1),
                _buildProfileRow(Icons.language_outlined, 'Тіл', 'Қазақша'),
                const Divider(height: 1),
                _buildProfileRow(Icons.notifications_outlined, 'Хабарландырулар', 'Қосулы'),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.security, color: AppColors.primaryBlue),
                  title: const Text('Құпиялылық және қауіпсіздік'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline, color: AppColors.primaryBlue),
                  title: const Text('Көмек (Қолдау қызметі)'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Logout button
          TextButton.icon(
            onPressed: () {
              // Mock logout simply goes back in MVP
            },
            icon: const Icon(Icons.logout, color: AppColors.error),
            label: const Text('Шығу', style: TextStyle(color: AppColors.error, fontSize: 16)),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildProfileRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryBlue),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 16, color: AppColors.textPrimary)),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

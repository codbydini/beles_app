import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'profile_screen.dart';
import 'catalog_screen.dart';
import 'map_screen.dart';
import 'news_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeDashboard(),
    CatalogScreen(), 
    MapScreen(),
    NewsScreen(),
    ProfileScreen(), // Registration / Profile (Lazy Login)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Басты'),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined), activeIcon: Icon(Icons.search), label: 'Каталог'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), activeIcon: Icon(Icons.map), label: 'Карта'),
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined), activeIcon: Icon(Icons.message), label: 'Хабарлар'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Профиль'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'BELES', 
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.w900, 
                      color: AppColors.primaryBlue,
                      letterSpacing: 1.5,
                    )
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined, color: AppColors.primaryBlue), 
                    onPressed: () {}
                  ),
                ],
              ),
            ),
            
            // Carousel Banner (Mockup)
            Container(
              height: 160,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Жаңа тұрғын үй кешені\n"BELES City"', 
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '-10% алғашқы жарнамен', 
                      style: TextStyle(color: Colors.white70, fontSize: 14)
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: const Text('Толығырақ', style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 12)),
                    )
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Services Grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Услуги / Қызметтер', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            ),
            const SizedBox(height: 16),
            
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildServiceItem(Icons.cleaning_services, 'Үй тазалау', context),
                _buildServiceItem(Icons.build_circle_outlined, 'Жөндеу заттары', context),
                _buildServiceItem(Icons.handyman_outlined, 'Шебер шақыру', context),
                _buildServiceItem(Icons.water_drop_outlined, 'Су жеткізу', context),
                _buildServiceItem(Icons.security_outlined, 'Қауіпсіздік', context),
                _buildServiceItem(Icons.grid_view_outlined, 'Барлығы', context),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // News / Feed
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text('Жаңалықтар', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            ),
            const SizedBox(height: 16),
            
            _buildNewsCard('BELES Towers құрылысы', 'Астана қаласындағы жаңа жобамызбен танысыңыз. Қауыз жұмыстары аяқталды.', 'Кеше, 14:30'),
            _buildNewsCard('Көктемгі сенбілік', 'Бұл демалыста барлық тұрғындарды ауланы тазалауға шақырамыз.', '10 Наурыз, 09:00'),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(IconData icon, String label, BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$label - дайындалуда...')));
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
                ],
              ),
              child: Icon(icon, color: AppColors.primaryBlue, size: 32),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label, 
            textAlign: TextAlign.center, 
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(String title, String subtitle, String date) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.image_outlined, color: Colors.grey, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
                const SizedBox(height: 6),
                Text(
                  subtitle, 
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(date, style: const TextStyle(color: AppColors.primaryBlue, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

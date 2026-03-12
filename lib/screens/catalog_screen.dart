import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _selectedCity = 'Астана';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header & Filters
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Каталог', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryBlue)),
                    DropdownButton<String>(
                      value: _selectedCity,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.primaryBlue),
                      style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryBlue, fontSize: 16),
                      onChanged: (String? newValue) {
                        setState(() { _selectedCity = newValue!; });
                      },
                      items: <String>['Астана', 'Алматы', 'Шымкент']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(value: value, child: Text(value));
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip('Бағасы', Icons.attach_money),
                      const SizedBox(width: 8),
                      _buildFilterChip('Көлемі (м²)', Icons.square_foot),
                      const SizedBox(width: 8),
                      _buildFilterChip('Бөлме саны', Icons.meeting_room),
                      const SizedBox(width: 8),
                      _buildFilterChip('Күні бойынша', Icons.calendar_today),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildPropertyCard('BELES Towers', 'Астана қ., Нұра ауданы', '22.5 млн ₸ бастап', '35 - 120 м² • 1-4 бөлмелі'),
                _buildPropertyCard('BELES City', 'Астана қ., Есіл ауданы', '18.9 млн ₸ бастап', '40 - 95 м² • 1-3 бөлмелі', isPremium: true),
                _buildPropertyCard('Eco Park Residence', 'Алматы қ., Бостандық ауданы', '35.0 млн ₸ бастап', '50 - 150 м² • 2-5 бөлмелі'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(String title, String location, String price, String details, {bool isPremium = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder Image
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Stack(
              children: [
                const Center(child: Icon(Icons.apartment, size: 60, color: Colors.white)),
                if (isPremium)
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(8)),
                      child: const Text('PREMIUM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                    ),
                  ),
                Positioned(
                  top: 16,
                  right: 16,
                 child: Container(
                   padding: const EdgeInsets.all(8),
                   decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                   child: const Icon(Icons.favorite_border, color: AppColors.textSecondary, size: 20),
                 )
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryBlue)),
                    Text(price, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(location, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(details, style: const TextStyle(color: AppColors.textPrimary, fontSize: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

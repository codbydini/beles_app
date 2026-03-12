import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/beles_properties.dart';
import 'property_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  // 'all' means show everything, otherwise filter by name
  String _selectedName = 'all';

  List<BelesProperty> get _filteredProperties {
    if (_selectedName == 'all') return allProperties;
    return allProperties.where((p) => p.name == _selectedName).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // ── Header ──────────────────────────────────────
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Каталог',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlue,
                          ),
                        ),
                        Text(
                          '${allProperties.length} тұрғын үй кешені',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    // Status filter
                    Row(
                      children: [
                        _statusDot(Colors.blueAccent, 'Белсенді'),
                        const SizedBox(width: 12),
                        _statusDot(Colors.green, 'Аяқталған'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ── Property name filter chips ────────────
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      _buildNameChip('all', 'Барлығы'),
                      const SizedBox(width: 8),
                      ...allProperties.map((p) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: _buildNameChip(p.name, p.name),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Property list ────────────────────────────────
          Expanded(
            child: _filteredProperties.isEmpty
                ? const Center(
                    child: Text('Нысан табылмады',
                        style: TextStyle(color: AppColors.textSecondary)),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredProperties.length,
                    itemBuilder: (context, index) {
                      final property = _filteredProperties[index];
                      return _buildPropertyCard(context, property);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _statusDot(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildNameChip(String value, String label) {
    final isSelected = _selectedName == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedName = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryBlue : Colors.grey.shade300,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: AppColors.primaryBlue.withAlpha(50), blurRadius: 8, offset: const Offset(0, 2))]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyCard(BuildContext context, BelesProperty property) {
    final isCompleted = property.status == 'completed';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PropertyDetailScreen(property: property),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      image: AssetImage(
                        property.imagePath.isNotEmpty
                            ? property.imagePath
                            : 'assets/images/beles_city.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withAlpha(80)],
                      ),
                    ),
                  ),
                ),
                // Badge
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: isCompleted
                          ? Colors.green
                          : property.isPremium
                              ? AppColors.accent
                              : AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isCompleted
                          ? 'ТАПСЫРЫЛҒАН'
                          : property.housingClass.split('/').first.trim().toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Favorite
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.favorite_border, color: AppColors.textSecondary, size: 18),
                  ),
                ),
              ],
            ),

            // Info section
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 13, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${property.city}, ${property.address}',
                          style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Highlights
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _miniChip(Icons.layers, '${property.floors} қабат'),
                      _miniChip(Icons.calendar_today, property.yearCompleted),
                      if (property.apartments.isNotEmpty)
                        _miniChip(
                          Icons.attach_money,
                          property.apartments.first.price,
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // View detail button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PropertyDetailScreen(property: property),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primaryBlue),
                        foregroundColor: AppColors.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'Толығырақ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: AppColors.primaryBlue),
          const SizedBox(width: 4),
          Text(label,
              style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

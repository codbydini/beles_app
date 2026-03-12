import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/beles_properties.dart';

class PropertyDetailScreen extends StatelessWidget {
  final BelesProperty property;

  const PropertyDetailScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero image app bar
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: AppColors.primaryBlue,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppColors.primaryBlue, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    property.imagePath.isNotEmpty
                        ? property.imagePath
                        : 'assets/images/beles_city.png',
                    fit: BoxFit.cover,
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withAlpha(140)],
                      ),
                    ),
                  ),
                  // Status badge
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: property.status == 'completed'
                                ? Colors.green
                                : property.isPremium
                                    ? AppColors.accent
                                    : AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            property.status == 'completed'
                                ? 'ТАПСЫРЫЛҒАН'
                                : property.housingClass.split('/').first.trim().toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          property.name,
                          style: const TextStyle(
                            color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location + Quick Info
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.primaryBlue, size: 16),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${property.city}, ${property.district}, ${property.address}',
                          style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _chip(Icons.layers, '${property.floors} қабат'),
                      _chip(Icons.calendar_today, property.yearCompleted),
                      _chip(Icons.apartment, property.housingClass.split('/').first.trim()),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description
                  _sectionTitle('Кешен туралы'),
                  const SizedBox(height: 8),
                  Text(
                    property.description,
                    style: const TextStyle(color: AppColors.textSecondary, height: 1.6, fontSize: 14),
                  ),
                  const SizedBox(height: 24),

                  // Apartments
                  if (property.apartments.isNotEmpty) ...[
                    _sectionTitle('Пәтерлер'),
                    const SizedBox(height: 12),
                    ...property.apartments.map((apt) => _buildApartmentRow(apt)),
                    const SizedBox(height: 24),
                  ],

                  // Advantages
                  if (property.advantages.isNotEmpty) ...[
                    _sectionTitle('Артықшылықтары'),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: property.advantages
                          .map((adv) => _advantageChip(adv))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Nearby Infrastructure
                  if (property.nearbyInfrastructure.isNotEmpty) ...[
                    _sectionTitle('Жақын маңдағы объектілер'),
                    const SizedBox(height: 12),
                    ...property.nearbyInfrastructure
                        .map((item) => _infraRow(item)),
                    const SizedBox(height: 24),
                  ],

                  // Contact
                  _sectionTitle('Байланыс'),
                  const SizedBox(height: 12),
                  _contactRow(Icons.phone, property.managerPhone),
                  const SizedBox(height: 8),
                  _contactRow(Icons.email, property.email),
                  const SizedBox(height: 8),
                  _contactRow(Icons.business, property.salesOffice),
                  const SizedBox(height: 24),

                  // CTA button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Менеджерге хабарласу',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryBlue,
      ),
    );
  }

  Widget _chip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppColors.primaryBlue),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.primaryBlue, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildApartmentRow(ApartmentType apt) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.meeting_room_outlined, color: AppColors.primaryBlue, size: 20),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(apt.type,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  Text(apt.area,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ],
          ),
          Text(
            apt.price,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryBlue, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _advantageChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryBlue.withAlpha(50)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: AppColors.primaryBlue, size: 14),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(
                  fontSize: 12, color: AppColors.primaryBlue, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _infraRow(String item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.near_me, size: 14, color: AppColors.primaryBlue),
          const SizedBox(width: 10),
          Text(item, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _contactRow(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primaryBlue),
        const SizedBox(width: 10),
        Expanded(
          child: Text(value, style: const TextStyle(color: AppColors.textPrimary, fontSize: 13)),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../theme/app_colors.dart';
import '../data/beles_properties.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final LatLng _astanaCenter = const LatLng(51.128, 71.430);

  String _filter = 'all'; // 'all' | 'active' | 'completed'

  List<BelesProperty> get _filteredProperties {
    if (_filter == 'active') return astanaActive;
    if (_filter == 'completed') return astanaCompleted;
    return allProperties;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Interactive Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _astanaCenter,
              initialZoom: 12.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.beles_app',
              ),
              MarkerLayer(
                markers: _filteredProperties.map((property) {
                  return Marker(
                    width: 130,
                    height: 80,
                    point: LatLng(property.latitude, property.longitude),
                    child: GestureDetector(
                      onTap: () => _showPropertyDetails(context, property),
                      child: _buildMapPin(
                        title: property.name,
                        isPremium: property.isPremium,
                        isCompleted: property.status == 'completed',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),

          // Top bar: Search + Filters
          SafeArea(
            child: Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Картадан іздеу (ТҮК атауы)',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: AppColors.primaryBlue),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildFilterChip('Барлығы', 'all'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Белсенді', 'active'),
                      const SizedBox(width: 8),
                      _buildFilterChip('Аяқталған', 'completed'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Property count badge
          Positioned(
            left: 16,
            bottom: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Text(
                '${_filteredProperties.length} нысан',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),

          // My location / center button
          Positioned(
            right: 16,
            bottom: 30,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                _mapController.move(_astanaCenter, 12.0);
              },
              child: const Icon(Icons.my_location, color: AppColors.primaryBlue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _filter == value;
    return GestureDetector(
      onTap: () => setState(() => _filter = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildMapPin({required String title, bool isPremium = false, bool isCompleted = false}) {
    final color = isCompleted
        ? Colors.grey.shade600
        : isPremium
            ? AppColors.accent
            : AppColors.primaryBlue;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isCompleted ? Icons.check_circle : Icons.apartment,
                color: Colors.white,
                size: 10,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Icon(Icons.arrow_drop_down, color: color, size: 20),
      ],
    );
  }

  void _showPropertyDetails(BuildContext context, BelesProperty property) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      property.name,
                      style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: property.status == 'completed'
                          ? Colors.green
                          : property.isPremium
                              ? AppColors.accent
                              : AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      property.status == 'completed' ? 'ТАПСЫРЫЛҒАН' : property.housingClass.split('/').first.trim().toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: AppColors.textSecondary),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${property.city}, ${property.address}',
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  _buildInfoChip(Icons.layers, '${property.floors} қабат'),
                  if (property.apartments.isNotEmpty)
                    _buildInfoChip(Icons.square_foot, property.apartments.first.area),
                  _buildInfoChip(Icons.calendar_today, property.yearCompleted),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.phone, size: 14, color: AppColors.primaryBlue),
                  const SizedBox(width: 6),
                  Text(property.managerPhone, style: const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Толығырақ көру', style: TextStyle(fontWeight: FontWeight.bold)),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.textSecondary),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

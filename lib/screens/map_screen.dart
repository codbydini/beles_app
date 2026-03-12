import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Simulated Map Background
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFE8F0F2), // Light map-like color
            child: CustomPaint(
              painter: MapGridPainter(),
            ),
          ),
          
          // Map Pins (Mockup)
          _buildMapPin(context, top: 200, left: 100, title: 'BELES Towers', price: '22.5 млн ₸'),
          _buildMapPin(context, top: 400, left: 250, title: 'BELES City', price: '18.9 млн ₸', isPremium: true),
          _buildMapPin(context, top: 500, left: 80, title: 'Eco Park', price: '35.0 млн ₸'),
          
          // Top Search Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
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
          ),
          
          // Bottom details card placeholder (appears when a pin is tapped)
          Positioned(
            right: 16,
            bottom: 30, // Above bottom nav
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(Icons.my_location, color: AppColors.primaryBlue),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMapPin(BuildContext context, {required double top, required double left, required String title, required String price, bool isPremium = false}) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () {
          // Show bottom sheet with details
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            builder: (context) => _buildPropertyDetails(title, price, isPremium),
          );
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isPremium ? AppColors.accent : AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))],
              ),
              child: Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
            Icon(Icons.arrow_drop_down, color: isPremium ? AppColors.accent : AppColors.primaryBlue, size: 30),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primaryBlue)),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyDetails(String title, String price, bool isPremium) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryBlue)),
              if (isPremium)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(8)),
                  child: const Text('PREMIUM', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(price, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 16),
          const Text('Астана қ., Есіл ауданы • 1-4 бөлмелі пәтерлер', style: TextStyle(color: Colors.grey)),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Толығырақ көру', style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}

class MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;
      
    // Draw some random "streets" for the map feel
    canvas.drawLine(const Offset(-50, 150), Offset(size.width + 50, 200), paint);
    canvas.drawLine(const Offset(-50, 450), Offset(size.width + 50, 400), paint);
    canvas.drawLine(const Offset(150, -50), const Offset(120, 900), paint);
    canvas.drawLine(const Offset(280, -50), const Offset(340, 900), paint);
    
    // Minor streets
    paint.strokeWidth = 3;
    canvas.drawLine(const Offset(120, 250), const Offset(290, 280), paint);
    canvas.drawLine(const Offset(0, 600), const Offset(150, 500), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

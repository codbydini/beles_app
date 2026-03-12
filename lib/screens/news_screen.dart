import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16.0),
            color: AppColors.surface,
            width: double.infinity,
            child: const Text(
              'Жаңалықтар',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildNewsItem(
                  'BELES City құрылысының барысы',
                  'Бүгін BELES City тұрғын үй кешенінің 5-ші қабатының монолит құю жұмыстары сәтті аяқталды. Құрылыс кестеге сай жүріп жатыр.',
                  'Бүгін, 10:00',
                  Icons.construction,
                ),
                _buildNewsItem(
                  'Жаңа "Smart Home" қызметі',
                  'BELES қосымшасы арқылы енді үйіңіздегі смарт құрылғыларды басқара аласыз. Баптаулар өте қарапайым.',
                  'Кеше, 16:45',
                  Icons.home_max,
                ),
                _buildNewsItem(
                  'Балалар алаңы тапсырылды',
                  'BELES Towers ауласындағы заманауи балалар алаңы толығымен аяқталып, тұрғындар игілігіне берілді.',
                  '10 Наурыз, 11:20',
                  Icons.park,
                ),
                _buildNewsItem(
                  'Көктемгі жеңілдіктер',
                  'Наурыз айына орай жөндеу материалдарына 15% жеңілдік жариялаймыз! Толық ақпарат "Қызметтер" бөлімінде.',
                  '8 Наурыз, 09:00',
                  Icons.discount,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String content, String date, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Толығырақ',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

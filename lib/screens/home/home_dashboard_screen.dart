import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../models/user_model.dart';
import '../../widgets/common/app_bottom_nav.dart';
import '../../widgets/cards/category_card.dart';
import '../help_request/create_help_request_screen.dart';
import '../emergency/emergency_screen.dart';
import '../notifications/notifications_screen.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel.sample();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.volunteer_activism, color: AppColors.primary),
            SizedBox(width: 8),
            Text(AppConstants.appName),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good morning, ${user.name} 👋', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 4),
            const Text('How can we help you today?', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: AppConstants.helpCategories.take(6).map((cat) {
                return CategoryCard(
                  label: cat,
                  icon: CategoryCard.iconFor(cat),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CreateHelpRequestScreen(initialCategory: cat)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const EmergencyScreen())),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.emergency.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.emergency.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: AppColors.emergency, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Emergency? Need urgent help?',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration:
                          BoxDecoration(color: AppColors.emergency, borderRadius: BorderRadius.circular(10)),
                      child: const Text('Tap for SOS',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add),
        label: const Text('Request Help'),
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateHelpRequestScreen())),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}

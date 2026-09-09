import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../requests/nearby_requests_list_screen.dart';

class VolunteerModeScreen extends StatelessWidget {
  const VolunteerModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('I want to Help')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 140,
              height: 140,
              decoration:
                  BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: const Icon(Icons.volunteer_activism, size: 64, color: AppColors.primary),
            ),
            const SizedBox(height: 24),
            Text('You are now a Volunteer!', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            const Text('Help your community. Make a difference.',
                textAlign: TextAlign.center, style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Available Requests', style: TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('View nearby help requests'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const NearbyRequestsListScreen())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

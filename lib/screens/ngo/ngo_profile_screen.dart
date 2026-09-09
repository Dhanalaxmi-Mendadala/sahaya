import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/common/custom_button.dart';

class NgoProfileScreen extends StatelessWidget {
  const NgoProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('NGO Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration:
                  BoxDecoration(color: AppColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
              child: const Icon(Icons.apartment_outlined, size: 44, color: AppColors.primary),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Helping Hands NGO', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 6),
                Icon(Icons.verified, color: AppColors.primary, size: 18),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'We work for better education, health and community development.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _NgoStat(value: '120', label: 'Active Requests'),
                  _NgoStat(value: '5.0', label: 'Rating'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(label: 'View Requests', onPressed: () {}),
            const SizedBox(height: 12),
            CustomButton(label: 'Contact', outlined: true, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _NgoStat extends StatelessWidget {
  final String value;
  final String label;
  const _NgoStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
      ],
    );
  }
}

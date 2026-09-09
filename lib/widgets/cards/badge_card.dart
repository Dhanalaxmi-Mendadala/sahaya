import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/user_model.dart';

class BadgeCard extends StatelessWidget {
  final BadgeModel badge;
  const BadgeCard({super.key, required this.badge});

  @override
  Widget build(BuildContext context) {
    final color = badge.earned ? AppColors.badgeGold : AppColors.textHint;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(Icons.emoji_events, color: color, size: 32),
          const SizedBox(height: 8),
          Text(badge.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          const SizedBox(height: 2),
          Text(badge.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/user_model.dart';

class GroupCard extends StatelessWidget {
  final CommunityGroup group;
  const GroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration:
                BoxDecoration(color: AppColors.primary.withValues(alpha: 0.12), shape: BoxShape.circle),
            child: const Icon(Icons.groups_outlined, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(group.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(group.members, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(minimumSize: const Size(64, 34)),
            onPressed: () {},
            child: const Text('Join', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

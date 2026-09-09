import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/help_request.dart';
import '../cards/category_card.dart';

class RequestCard extends StatelessWidget {
  final HelpRequest request;
  final VoidCallback? onView;

  const RequestCard({super.key, required this.request, this.onView});

  @override
  Widget build(BuildContext context) {
    final catColor = AppColors.categoryColor(request.category);
    final urgColor = AppColors.urgencyColor(request.urgency);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: catColor.withValues(alpha: 0.15), shape: BoxShape.circle),
            child: Icon(CategoryCard.iconFor(request.category), color: catColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(request.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 2),
                Text(request.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text('${request.distanceKm} km', style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
                    const SizedBox(width: 6),
                    const Text('•', style: TextStyle(color: AppColors.textHint, fontSize: 11)),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: urgColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
                      child: Text(request.urgency,
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: urgColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(64, 34),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              side: BorderSide(color: catColor),
              foregroundColor: catColor,
            ),
            onPressed: onView,
            child: const Text('View', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}

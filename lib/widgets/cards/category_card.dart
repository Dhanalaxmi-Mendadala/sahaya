import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.label,
    required this.icon,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppColors.categoryColor(label);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? color : Colors.transparent,
            width: 1.5,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  static IconData iconFor(String category) {
    switch (category.toLowerCase()) {
      case 'food':
        return Icons.restaurant;
      case 'medical':
        return Icons.medical_services_outlined;
      case 'transport':
        return Icons.directions_car_outlined;
      case 'blood':
        return Icons.bloodtype_outlined;
      case 'education':
        return Icons.school_outlined;
      case 'elderly care':
        return Icons.elderly_outlined;
      case 'child care':
        return Icons.child_care_outlined;
      case 'repair':
        return Icons.build_outlined;
      default:
        return Icons.more_horiz;
    }
  }
}

import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/notification_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  IconData _iconFor(NotificationType type) {
    switch (type) {
      case NotificationType.accepted:
        return Icons.check_circle_outline;
      case NotificationType.newRequest:
        return Icons.notifications_active_outlined;
      case NotificationType.message:
        return Icons.chat_bubble_outline;
      case NotificationType.completed:
        return Icons.task_alt;
      case NotificationType.system:
        return Icons.mail_outline;
    }
  }

  Color _colorFor(NotificationType type) {
    switch (type) {
      case NotificationType.accepted:
        return AppColors.primary;
      case NotificationType.newRequest:
        return AppColors.medical;
      case NotificationType.message:
        return AppColors.transport;
      case NotificationType.completed:
        return AppColors.urgencyLow;
      case NotificationType.system:
        return AppColors.education;
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = NotificationModel.sample();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('Notifications')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, i) {
          final n = items[i];
          final color = _colorFor(n.type);
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: color.withValues(alpha: 0.12), shape: BoxShape.circle),
                  child: Icon(_iconFor(n.type), color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(n.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      Text(n.subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                Text(n.timeAgo, style: const TextStyle(fontSize: 11, color: AppColors.textHint)),
              ],
            ),
          );
        },
      ),
    );
  }
}

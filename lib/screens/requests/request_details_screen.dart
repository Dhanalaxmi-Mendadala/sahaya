import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/help_request.dart';
import '../../widgets/cards/category_card.dart';
import '../../widgets/common/custom_button.dart';
import '../chat/chat_screen.dart';

class RequestDetailsScreen extends StatelessWidget {
  final HelpRequest request;
  const RequestDetailsScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.categoryColor(request.category);
    final urgColor = AppColors.urgencyColor(request.urgency);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('Request Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: color.withValues(alpha: 0.12),
              child: Icon(CategoryCard.iconFor(request.category), size: 64, color: color),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(request.title, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 6),
                  Text(request.description, style: const TextStyle(color: AppColors.textSecondary)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.social_distance_outlined, size: 18, color: AppColors.textHint),
                      const SizedBox(width: 6),
                      Text('${request.distanceKm} km away'),
                      const SizedBox(width: 14),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                            color: urgColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(20)),
                        child: Text('${request.urgency} urgency',
                            style: TextStyle(color: urgColor, fontWeight: FontWeight.w600, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(request.postedAgo, style: const TextStyle(color: AppColors.textHint, fontSize: 12)),
                  const Divider(height: 32),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 20, color: AppColors.textSecondary),
                      const SizedBox(width: 8),
                      Expanded(child: Text(request.location)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.contact_phone_outlined, size: 20, color: AppColors.textSecondary),
                      SizedBox(width: 8),
                      Text('Contact Preference: Call / Chat'),
                    ],
                  ),
                  const SizedBox(height: 28),
                  CustomButton(
                    label: 'Accept Request',
                    onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const ChatScreen())),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined, size: 18),
                        label: const Text('Share'),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.flag_outlined, size: 18, color: AppColors.emergency),
                        label: const Text('Report', style: TextStyle(color: AppColors.emergency)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/common/custom_button.dart';
import '../requests/request_status_screen.dart';

/// NOTE: Replace the placeholder map area with `google_maps_flutter`
/// GoogleMap + Polyline once API keys / directions are wired up.
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('To: Lakshmi Nagar')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFFE6ECE5),
              child: const Center(child: Icon(Icons.alt_route, size: 90, color: AppColors.primary)),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.timer_outlined, color: AppColors.textSecondary),
                    SizedBox(width: 8),
                    Text('1.2 km  •  5 min', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  label: 'Start Navigation',
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const RequestStatusScreen())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

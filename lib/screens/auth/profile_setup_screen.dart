import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../home/home_dashboard_screen.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('Tell us about yourself')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 44,
                    backgroundColor: AppColors.border,
                    child: Icon(Icons.person, size: 44, color: AppColors.textHint),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                      child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const CustomTextField(label: 'Name', hint: 'Dhanalaxmi'),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Phone Number', hint: '+91 9876543210', prefixIcon: Icons.phone_outlined),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Location', hint: 'Add your location', prefixIcon: Icons.location_on_outlined),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Emergency Contact', hint: '+91 9876543210', prefixIcon: Icons.contact_phone_outlined),
            const SizedBox(height: 16),
            const CustomTextField(label: 'Languages Spoken', hint: 'Telugu, English', prefixIcon: Icons.translate_outlined),
            const SizedBox(height: 32),
            CustomButton(
              label: 'Next',
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomeDashboardScreen()),
                (route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

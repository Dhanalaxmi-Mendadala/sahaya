import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/user_model.dart';
import '../../widgets/common/app_bottom_nav.dart';
import '../requests/request_status_screen.dart';
import 'reputation_badges_screen.dart';
import '../community/community_groups_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel.sample();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 34,
                backgroundColor: AppColors.border,
                child: Icon(Icons.person, size: 34, color: AppColors.textHint),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name, style: Theme.of(context).textTheme.titleLarge),
                    Text(user.level, style: const TextStyle(color: AppColors.primary, fontSize: 12)),
                  ],
                ),
              ),
            ],
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
              children: [
                _stat('${user.totalHelps}', 'Total Helps'),
                _divider(),
                _stat('${user.rating}', 'Rating'),
                _divider(),
                _stat('${user.badges}', 'Badges'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _menuTile(context, Icons.list_alt_outlined, 'My Requests',
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RequestStatusScreen()))),
          _menuTile(context, Icons.favorite_border, 'My Donations', () {}),
          _menuTile(context, Icons.emoji_events_outlined, 'My Badges',
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReputationBadgesScreen()))),
          _menuTile(context, Icons.groups_outlined, 'Community Groups',
              () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CommunityGroupsScreen()))),
          _menuTile(context, Icons.settings_outlined, 'Settings', () {}),
          _menuTile(context, Icons.help_outline, 'Help & Support', () {}),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 4),
    );
  }

  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _divider() => Container(width: 1, height: 30, color: AppColors.border);

  Widget _menuTile(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: const TextStyle(fontSize: 14)),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
        onTap: onTap,
      ),
    );
  }
}

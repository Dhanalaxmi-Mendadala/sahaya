import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/user_model.dart';
import '../../widgets/cards/group_card.dart';

class CommunityGroupsScreen extends StatelessWidget {
  const CommunityGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = CommunityGroup.sample();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('Community Groups')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: groups.length,
        itemBuilder: (context, i) => GroupCard(group: groups[i]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

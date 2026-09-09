import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/cards/category_card.dart';
import '../requests/nearby_requests_map_screen.dart';

class CreateHelpRequestScreen extends StatefulWidget {
  final String? initialCategory;
  const CreateHelpRequestScreen({super.key, this.initialCategory});

  @override
  State<CreateHelpRequestScreen> createState() => _CreateHelpRequestScreenState();
}

class _CreateHelpRequestScreenState extends State<CreateHelpRequestScreen> {
  late String _category;
  String _urgency = 'Medium';

  @override
  void initState() {
    super.initState();
    _category = widget.initialCategory ?? AppConstants.helpCategories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('Create Help Request')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: AppConstants.helpCategories.map((cat) {
                return CategoryCard(
                  label: cat,
                  icon: CategoryCard.iconFor(cat),
                  selected: _category == cat,
                  onTap: () => setState(() => _category = cat),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const CustomTextField(label: 'Title', hint: 'E.g. Need food for my family'),
            const SizedBox(height: 16),
            const CustomTextField(
                label: 'Description', hint: 'Provide more details...', maxLines: 4),
            const SizedBox(height: 16),
            const CustomTextField(
                label: 'Location', hint: 'Use current location', prefixIcon: Icons.my_location_outlined),
            const SizedBox(height: 16),
            const Text('Urgency Level',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 8),
            Row(
              children: AppConstants.urgencyLevels.map((level) {
                final selected = _urgency == level;
                final color = AppColors.urgencyColor(level);
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _urgency = level),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected ? color : color.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(level,
                          style: TextStyle(
                              color: selected ? Colors.white : color, fontWeight: FontWeight.w600)),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.add_a_photo_outlined, color: AppColors.textHint),
              ),
            ),
            const SizedBox(height: 6),
            const Text('Add Photos (optional)', style: TextStyle(fontSize: 12, color: AppColors.textHint)),
            const SizedBox(height: 28),
            CustomButton(
              label: 'Submit Request',
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NearbyRequestsMapScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

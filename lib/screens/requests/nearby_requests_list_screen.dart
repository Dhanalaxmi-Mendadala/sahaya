import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/help_request.dart';
import '../../widgets/common/app_bottom_nav.dart';
import '../../widgets/cards/request_card.dart';
import 'request_details_screen.dart';

class NearbyRequestsListScreen extends StatefulWidget {
  const NearbyRequestsListScreen({super.key});

  @override
  State<NearbyRequestsListScreen> createState() => _NearbyRequestsListScreenState();
}

class _NearbyRequestsListScreenState extends State<NearbyRequestsListScreen> {
  String _filter = 'All';
  final _filters = const ['All', 'Food', 'Medical', 'Transport'];

  @override
  Widget build(BuildContext context) {
    final requests = HelpRequest.sampleFeed()
        .where((r) => _filter == 'All' || r.category == _filter)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Nearby Requests')),
      body: Column(
        children: [
          SizedBox(
            height: 44,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final f = _filters[i];
                final selected = f == _filter;
                return ChoiceChip(
                  label: Text(f),
                  selected: selected,
                  onSelected: (_) => setState(() => _filter = f),
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(color: selected ? Colors.white : AppColors.textPrimary),
                  backgroundColor: AppColors.surface,
                  side: const BorderSide(color: AppColors.border),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: requests.length,
              itemBuilder: (context, i) {
                final r = requests[i];
                return RequestCard(
                  request: r,
                  onView: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RequestDetailsScreen(request: r))),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }
}

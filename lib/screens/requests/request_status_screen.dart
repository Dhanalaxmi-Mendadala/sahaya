import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/cards/category_card.dart';

class _StatusRequest {
  final String title;
  final String subtitle;
  final String status;
  final double distanceKm;
  final String category;
  const _StatusRequest(this.title, this.subtitle, this.status, this.distanceKm, this.category);
}

class RequestStatusScreen extends StatefulWidget {
  const RequestStatusScreen({super.key});

  @override
  State<RequestStatusScreen> createState() => _RequestStatusScreenState();
}

class _RequestStatusScreenState extends State<RequestStatusScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tab = TabController(length: 3, vsync: this);

  final _all = const [
    _StatusRequest('Food Request', 'Need food for my family', 'In Progress', 1.2, 'Food'),
    _StatusRequest('Medical Request', 'Medicine purchase needed', 'Accepted', 2.8, 'Medical'),
    _StatusRequest('Transport Request', 'Hospital transport', 'Completed', 3.4, 'Transport'),
    _StatusRequest('Education Request', 'Math tuition help', 'Open', 4.1, 'Education'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Requests'),
        bottom: TabBar(
          controller: _tab,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textHint,
          indicatorColor: AppColors.primary,
          tabs: const [Tab(text: 'Open'), Tab(text: 'In Progress'), Tab(text: 'Completed')],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: [
          _buildList(_all.where((r) => r.status == 'Open').toList()),
          _buildList(_all.where((r) => r.status == 'In Progress' || r.status == 'Accepted').toList()),
          _buildList(_all.where((r) => r.status == 'Completed').toList()),
        ],
      ),
    );
  }

  Widget _buildList(List<_StatusRequest> items) {
    if (items.isEmpty) {
      return const Center(child: Text('No requests here yet', style: TextStyle(color: AppColors.textHint)));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, i) {
        final r = items[i];
        final color = AppColors.categoryColor(r.category);
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
                child: Icon(CategoryCard.iconFor(r.category), color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text(r.subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    const SizedBox(height: 4),
                    Text('${r.status} • ${r.distanceKm} km',
                        style: const TextStyle(fontSize: 11, color: AppColors.primary)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textHint),
            ],
          ),
        );
      },
    );
  }
}

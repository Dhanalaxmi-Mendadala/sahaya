import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../models/help_request.dart';
import '../../widgets/common/app_bottom_nav.dart';
import 'request_details_screen.dart';

/// NOTE: Replace the placeholder Container with a real `google_maps_flutter`
/// GoogleMap widget once you add markers for each HelpRequest location.
class NearbyRequestsMapScreen extends StatelessWidget {
  const NearbyRequestsMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requests = HelpRequest.sampleFeed();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(leading: const BackButton(), title: const Text('Nearby Requests')),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  color: const Color(0xFFE6ECE5),
                  child: const Center(
                    child: Icon(Icons.map_outlined, size: 80, color: AppColors.textHint),
                  ),
                ),
                // Simulated markers
                for (int i = 0; i < requests.length; i++)
                  Positioned(
                    left: 40.0 + (i * 60) % 220,
                    top: 60.0 + (i * 70) % 200,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RequestDetailsScreen(request: requests[i])),
                      ),
                      child: Icon(Icons.location_on,
                          color: AppColors.categoryColor(requests[i].category), size: 36),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nearby Requests', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: requests.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, i) {
                        final r = requests[i];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Icons.location_on, color: AppColors.categoryColor(r.category)),
                          title: Text(r.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          subtitle: Text('${r.description} • ${r.distanceKm} km', style: const TextStyle(fontSize: 11)),
                          trailing: TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => RequestDetailsScreen(request: r)),
                            ),
                            child: const Text('View'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2),
    );
  }
}

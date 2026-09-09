import 'package:flutter/material.dart';
import '../../screens/home/home_dashboard_screen.dart';
import '../../screens/requests/nearby_requests_list_screen.dart';
import '../../screens/requests/nearby_requests_map_screen.dart';
import '../../screens/chat/chat_screen.dart';
import '../../screens/profile/profile_screen.dart';

/// Bottom navigation bar matching Home / Requests / Map / Chat / Profile
/// tabs shown throughout the mockups.
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;
    Widget screen;
    switch (index) {
      case 0:
        screen = const HomeDashboardScreen();
        break;
      case 1:
        screen = const NearbyRequestsListScreen();
        break;
      case 2:
        screen = const NearbyRequestsMapScreen();
        break;
      case 3:
        screen = const ChatScreen();
        break;
      default:
        screen = const ProfileScreen();
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (i) => _navigate(context, i),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Requests'),
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}

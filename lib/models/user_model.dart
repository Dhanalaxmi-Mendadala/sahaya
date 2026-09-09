class UserModel {
  final String name;
  final String phone;
  final String? avatarUrl;
  final String level;
  final int totalHelps;
  final double rating;
  final int badges;
  final String location;
  final String emergencyContact;
  final List<String> languages;

  const UserModel({
    required this.name,
    required this.phone,
    this.avatarUrl,
    this.level = 'Volunteer',
    this.totalHelps = 0,
    this.rating = 0.0,
    this.badges = 0,
    this.location = '',
    this.emergencyContact = '',
    this.languages = const [],
  });

  static UserModel sample() {
    return const UserModel(
      name: 'Dhanalaxmi',
      phone: '+91 9876543210',
      level: 'Volunteer • Level 2 • 25 helps',
      totalHelps: 25,
      rating: 4.8,
      badges: 12,
      location: 'Vijayawada',
      emergencyContact: '+91 9876543210',
      languages: ['Telugu', 'English'],
    );
  }
}

class BadgeModel {
  final String title;
  final String subtitle;
  final bool earned;

  const BadgeModel({required this.title, required this.subtitle, this.earned = true});

  static List<BadgeModel> sample() {
    return const [
      BadgeModel(title: 'First Helper', subtitle: '1st help'),
      BadgeModel(title: '10 Helps', subtitle: '10 requests'),
      BadgeModel(title: '100 Helps', subtitle: '100 requests'),
      BadgeModel(title: 'Hero Volunteer', subtitle: '500+ helps', earned: false),
    ];
  }
}

class CommunityGroup {
  final String name;
  final String members;

  const CommunityGroup({required this.name, required this.members});

  static List<CommunityGroup> sample() {
    return const [
      CommunityGroup(name: 'Lakshmi Nagar Group', members: '1.2K members'),
      CommunityGroup(name: 'JNTU Students', members: '3.5K members'),
      CommunityGroup(name: 'Rural Community', members: '890 members'),
      CommunityGroup(name: 'Green Valley Apartments', members: '1.1K members'),
    ];
  }
}

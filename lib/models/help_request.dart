enum RequestStatus { open, accepted, inProgress, completed }

class HelpRequest {
  final String id;
  final String title;
  final String description;
  final String category;
  final String urgency; // Low, Medium, High
  final double distanceKm;
  final String location;
  final String postedAgo;
  final RequestStatus status;
  final String requesterName;

  const HelpRequest({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.urgency,
    required this.distanceKm,
    required this.location,
    required this.postedAgo,
    this.status = RequestStatus.open,
    this.requesterName = '',
  });

  static List<HelpRequest> sampleFeed() {
    return const [
      HelpRequest(
        id: '1',
        title: 'Food Request',
        description: 'Need food for my family (2 adults + 1 child)',
        category: 'Food',
        urgency: 'High',
        distanceKm: 1.2,
        location: 'Near Lakshmi Nagar, Vijayawada',
        postedAgo: 'Posted 2 hours ago',
        requesterName: 'Ravi',
      ),
      HelpRequest(
        id: '2',
        title: 'Medical Request',
        description: 'Medicine purchase needed for diabetes',
        category: 'Medical',
        urgency: 'Medium',
        distanceKm: 2.8,
        location: 'Gandhi Nagar',
        postedAgo: 'Posted 4 hours ago',
      ),
      HelpRequest(
        id: '3',
        title: 'Transport Request',
        description: 'Need hospital transport',
        category: 'Transport',
        urgency: 'Medium',
        distanceKm: 3.4,
        location: 'MG Road',
        postedAgo: 'Posted 1 hour ago',
      ),
      HelpRequest(
        id: '4',
        title: 'Education Request',
        description: 'Need help with math tuition',
        category: 'Education',
        urgency: 'Low',
        distanceKm: 4.1,
        location: 'Patamata',
        postedAgo: 'Posted yesterday',
      ),
    ];
  }
}

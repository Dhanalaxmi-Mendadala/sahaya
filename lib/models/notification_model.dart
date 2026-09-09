enum NotificationType { accepted, newRequest, message, completed, system }

class NotificationModel {
  final NotificationType type;
  final String title;
  final String subtitle;
  final String timeAgo;

  const NotificationModel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
  });

  static List<NotificationModel> sample() {
    return const [
      NotificationModel(
        type: NotificationType.accepted,
        title: 'Request accepted',
        subtitle: 'Ravi accepted your request',
        timeAgo: '2 min ago',
      ),
      NotificationModel(
        type: NotificationType.newRequest,
        title: 'New nearby request',
        subtitle: 'Medical help needed (2.8 km)',
        timeAgo: '10 min ago',
      ),
      NotificationModel(
        type: NotificationType.message,
        title: 'Chat message',
        subtitle: "Ravi: I'm on my way",
        timeAgo: '15 min ago',
      ),
      NotificationModel(
        type: NotificationType.completed,
        title: 'Request completed',
        subtitle: 'You helped Sita Devi',
        timeAgo: '2 hours ago',
      ),
      NotificationModel(
        type: NotificationType.system,
        title: 'New message',
        subtitle: 'From NGO: Free medical camp',
        timeAgo: 'Yesterday',
      ),
    ];
  }
}

class ChatMessage {
  final String text;
  final bool isMe;
  final String time;

  const ChatMessage({required this.text, required this.isMe, required this.time});

  static List<ChatMessage> sample() {
    return const [
      ChatMessage(text: 'Hi, I need help with food. Can you assist?', isMe: false, time: '10:15 AM'),
      ChatMessage(text: "Yes, I can help. I'm nearby.", isMe: true, time: '10:15 AM'),
      ChatMessage(text: "That's great! Thank you!", isMe: false, time: '10:17 AM'),
    ];
  }
}

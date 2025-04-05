class NotificationModel {
  final int id;
  final String title;
  final String message;
  final String date;
  final String status; // الحالة (جديد، قيد التنفيذ، مكتمل)
  bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.status,
    this.isRead = false,
  });
}

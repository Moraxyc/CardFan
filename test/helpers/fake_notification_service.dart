import 'package:cardfan/core/services/notification_service.dart';

class FakeNotificationService implements NotificationService {
  final scheduled = <ScheduledNotification>[];
  final cancelled = <int>[];
  bool permissionsGranted = true;
  int permissionRequests = 0;

  @override
  Future<bool> initialize() async => true;

  @override
  Future<bool> requestPermissions() async {
    permissionRequests += 1;
    return permissionsGranted;
  }

  @override
  Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledAt,
  }) async {
    scheduled.add(
      ScheduledNotification(
        id: id,
        title: title,
        body: body,
        scheduledAt: scheduledAt,
      ),
    );
  }

  @override
  Future<void> cancel(int id) async {
    cancelled.add(id);
  }
}

class ScheduledNotification {
  const ScheduledNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.scheduledAt,
  });

  final int id;
  final String title;
  final String body;
  final DateTime scheduledAt;

  @override
  bool operator ==(Object other) {
    return other is ScheduledNotification &&
        other.id == id &&
        other.title == title &&
        other.body == body &&
        other.scheduledAt == scheduledAt;
  }

  @override
  int get hashCode => Object.hash(id, title, body, scheduledAt);
}

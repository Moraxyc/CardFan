import '../database/app_database.dart';
import 'notification_service.dart';

class NotificationScheduler {
  NotificationScheduler(this._service);

  final NotificationService _service;

  Future<int?> scheduleReminder(Reminder reminder) async {
    final notificationId = reminder.notificationId ?? _stableId(reminder.id);
    final now = DateTime.now().toUtc();

    if (!reminder.enabled || reminder.deletedAt != null) {
      await cancelReminder(notificationId);
      return null;
    }

    if (!reminder.scheduledAt.isAfter(now)) {
      await cancelReminder(notificationId);
      return null;
    }

    final granted = await _service.requestPermissions();
    if (!granted) {
      await cancelReminder(notificationId);
      return null;
    }

    await _service.schedule(
      id: notificationId,
      title: reminder.title,
      body: reminder.body ?? '',
      scheduledAt: reminder.scheduledAt,
    );
    return notificationId;
  }

  Future<int?> rescheduleReminder(
    Reminder reminder, {
    int? previousNotificationId,
  }) async {
    if (previousNotificationId != null &&
        previousNotificationId != reminder.notificationId) {
      await cancelReminder(previousNotificationId);
    }
    return scheduleReminder(reminder);
  }

  Future<void> cancelReminder(int? notificationId) async {
    if (notificationId == null) {
      return;
    }
    await _service.cancel(notificationId);
  }

  int _stableId(String value) {
    var hash = 0;
    for (final unit in value.codeUnits) {
      hash = 0x1fffffff & (hash * 31 + unit);
    }
    return hash == 0 ? 1 : hash;
  }
}

import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/services/notification_scheduler.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_notification_service.dart';

void main() {
  test('schedules an enabled reminder at its scheduled time', () async {
    final service = FakeNotificationService();
    final scheduler = NotificationScheduler(service);
    final reminder = _reminder(
      id: 'reminder-1',
      title: 'Pay rent',
      body: 'Before 6pm',
      scheduledAt: DateTime.utc(2026, 5, 23, 10),
      notificationId: 42,
    );

    final notificationId = await scheduler.scheduleReminder(reminder);

    expect(notificationId, 42);
    expect(service.permissionRequests, 1);
    expect(service.scheduled, [
      ScheduledNotification(
        id: 42,
        title: 'Pay rent',
        body: 'Before 6pm',
        scheduledAt: DateTime.utc(2026, 5, 23, 10),
      ),
    ]);
    expect(service.cancelled, isEmpty);
  });

  test('uses a stable generated notification id when one is missing', () async {
    final service = FakeNotificationService();
    final scheduler = NotificationScheduler(service);
    final reminder = _reminder(
      id: 'reminder-1',
      title: 'Pay rent',
      scheduledAt: DateTime.utc(2026, 5, 23, 10),
    );

    final firstId = await scheduler.scheduleReminder(reminder);
    final secondId = await scheduler.scheduleReminder(reminder);

    expect(firstId, secondId);
    expect(firstId, greaterThan(0));
  });

  test(
    'cancels and returns null when notification permission is denied',
    () async {
      final service = FakeNotificationService()..permissionsGranted = false;
      final scheduler = NotificationScheduler(service);
      final reminder = _reminder(
        id: 'reminder-1',
        title: 'Pay rent',
        scheduledAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
        notificationId: 42,
      );

      final notificationId = await scheduler.scheduleReminder(reminder);

      expect(notificationId, isNull);
      expect(service.permissionRequests, 1);
      expect(service.scheduled, isEmpty);
      expect(service.cancelled, [42]);
    },
  );

  test('cancels existing notification when reminder is disabled', () async {
    final service = FakeNotificationService();
    final scheduler = NotificationScheduler(service);
    final reminder = _reminder(
      id: 'reminder-1',
      title: 'Pay rent',
      scheduledAt: DateTime.utc(2026, 5, 23, 10),
      notificationId: 42,
      enabled: false,
    );

    final notificationId = await scheduler.scheduleReminder(reminder);

    expect(notificationId, isNull);
    expect(service.scheduled, isEmpty);
    expect(service.cancelled, [42]);
  });

  test(
    'does not schedule reminder when scheduled time is in the past',
    () async {
      final service = FakeNotificationService();
      final scheduler = NotificationScheduler(service);
      final reminder = _reminder(
        id: 'reminder-1',
        title: 'Pay rent',
        scheduledAt: DateTime.now().toUtc().subtract(
          const Duration(minutes: 1),
        ),
        notificationId: 42,
      );

      final notificationId = await scheduler.scheduleReminder(reminder);

      expect(notificationId, isNull);
      expect(service.scheduled, isEmpty);
      expect(service.cancelled, [42]);
    },
  );

  test('reschedules changed reminder by cancelling the old id first', () async {
    final service = FakeNotificationService();
    final scheduler = NotificationScheduler(service);
    final reminder = _reminder(
      id: 'reminder-1',
      title: 'Pay rent',
      scheduledAt: DateTime.utc(2026, 5, 24, 9),
      notificationId: 42,
    );

    await scheduler.rescheduleReminder(reminder, previousNotificationId: 7);

    expect(service.cancelled, [7]);
    expect(service.scheduled.single.id, 42);
    expect(service.scheduled.single.scheduledAt, DateTime.utc(2026, 5, 24, 9));
  });

  test('cancels reminder notification when deleted', () async {
    final service = FakeNotificationService();
    final scheduler = NotificationScheduler(service);

    await scheduler.cancelReminder(42);

    expect(service.cancelled, [42]);
  });
}

Reminder _reminder({
  required String id,
  required String title,
  required DateTime scheduledAt,
  String? body,
  int? notificationId,
  bool enabled = true,
}) {
  final now = DateTime.utc(2026, 5, 22);
  return Reminder(
    id: id,
    title: title,
    body: body,
    scheduledAt: scheduledAt,
    notificationId: notificationId,
    enabled: enabled,
    createdAt: now,
    updatedAt: now,
    deletedAt: null,
    syncStatus: 'local',
    remoteId: null,
  );
}

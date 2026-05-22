import 'dart:async';

import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/database/daos/reminders_dao.dart';
import 'package:cardfan/core/services/notification_scheduler.dart';
import 'package:cardfan/core/services/runtime_reminder_service.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_notification_service.dart';

void main() {
  late AppDatabase database;
  late FakeNotificationService notificationService;
  late DateTime now;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    notificationService = FakeNotificationService()
      ..supportsOfflineScheduling = false;
    now = DateTime.utc(2026, 5, 22, 10);
  });

  tearDown(() async {
    await database.close();
  });

  test('shows a runtime notification for due enabled reminders', () async {
    final scheduler = NotificationScheduler(notificationService);
    final service = RuntimeReminderService(
      database.remindersDao,
      scheduler,
      now: () => now,
    );
    await database.remindersDao.create(
      RemindersCompanion.insert(
        id: 'reminder-1',
        title: 'Pay rent',
        body: const Value('Before 6pm'),
        scheduledAt: now.subtract(const Duration(minutes: 1)),
        notificationId: const Value(42),
        createdAt: now,
        updatedAt: now,
      ),
    );

    service.start();
    await service.checkDueReminders();

    expect(notificationService.shown, [
      const ShownNotification(id: 42, title: 'Pay rent', body: 'Before 6pm'),
    ]);

    await service.dispose();
  });

  test('shows a rescheduled reminder with the same id', () async {
    final scheduler = NotificationScheduler(notificationService);
    final service = RuntimeReminderService(
      database.remindersDao,
      scheduler,
      now: () => now,
    );
    final firstScheduledAt = now.subtract(const Duration(minutes: 1));
    await database.remindersDao.create(
      RemindersCompanion.insert(
        id: 'reminder-1',
        title: 'Pay rent',
        body: const Value('Before 6pm'),
        scheduledAt: firstScheduledAt,
        notificationId: const Value(42),
        createdAt: now,
        updatedAt: now,
      ),
    );

    await service.checkDueReminders();
    now = now.add(const Duration(hours: 1));
    final rescheduledAt = now.subtract(const Duration(minutes: 5));
    await database.remindersDao.updateRecord(
      RemindersCompanion(
        id: const Value('reminder-1'),
        scheduledAt: Value(rescheduledAt),
        updatedAt: Value(now),
      ),
    );
    await service.checkDueReminders();

    expect(notificationService.shown, [
      const ShownNotification(id: 42, title: 'Pay rent', body: 'Before 6pm'),
      const ShownNotification(id: 42, title: 'Pay rent', body: 'Before 6pm'),
    ]);

    await service.dispose();
  });

  test('does not run due reminder checks concurrently', () async {
    final dao = _BlockingRemindersDao(database);
    final notificationService = FakeNotificationService()
      ..supportsOfflineScheduling = false;
    final scheduler = NotificationScheduler(notificationService);
    final service = RuntimeReminderService(dao, scheduler, now: () => now);
    await database.remindersDao.create(
      RemindersCompanion.insert(
        id: 'reminder-1',
        title: 'Pay rent',
        body: const Value('Before 6pm'),
        scheduledAt: now.subtract(const Duration(minutes: 1)),
        notificationId: const Value(42),
        createdAt: now,
        updatedAt: now,
      ),
    );

    final firstCheck = service.checkDueReminders();
    await dao.firstGetActiveStarted.future;
    final secondCheck = service.checkDueReminders();
    await Future<void>.delayed(Duration.zero);

    expect(dao.getActiveCalls, 1);

    dao.allowGetActive.complete();
    await Future.wait([firstCheck, secondCheck]);

    expect(notificationService.shown, [
      const ShownNotification(id: 42, title: 'Pay rent', body: 'Before 6pm'),
    ]);
  });
}

class _BlockingRemindersDao extends RemindersDao {
  _BlockingRemindersDao(super.db);

  final firstGetActiveStarted = Completer<void>();
  final allowGetActive = Completer<void>();
  int getActiveCalls = 0;

  @override
  Future<List<Reminder>> getActive() async {
    getActiveCalls += 1;
    if (!firstGetActiveStarted.isCompleted) {
      firstGetActiveStarted.complete();
    }
    await allowGetActive.future;
    return super.getActive();
  }
}

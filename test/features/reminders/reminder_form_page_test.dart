import 'package:cardfan/app.dart';
import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/providers/database_provider.dart';
import 'package:cardfan/core/providers/notification_provider.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_notification_service.dart';

void main() {
  late AppDatabase database;
  late FakeNotificationService notificationService;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    notificationService = FakeNotificationService();
    await database.upsertSetting(
      'localeOverride',
      'zh-Hans',
      DateTime.utc(2026),
    );
  });

  tearDown(() async {
    await database.close();
  });

  Future<void> pumpRemindersPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(database),
          notificationServiceProvider.overrideWithValue(notificationService),
        ],
        child: const CardFanApp(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('提醒'));
    await tester.pumpAndSettle();
  }

  Future<void> pumpRoute(WidgetTester tester) async {
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
  }

  Future<void> disposeApp(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  }

  Future<void> openAddForm(WidgetTester tester) async {
    await pumpRemindersPage(tester);
    await tester.tap(find.byIcon(Icons.add));
    await pumpRoute(tester);
  }

  testWidgets('shows empty reminder list and opens add form', (tester) async {
    await pumpRemindersPage(tester);

    expect(find.text('还没有提醒'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await pumpRoute(tester);

    expect(find.text('新增提醒'), findsOneWidget);
    expect(find.byKey(const Key('reminderTitleField')), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('opens form with offline scheduling warning on Linux', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    try {
      notificationService.supportsOfflineScheduling = false;

      await pumpRemindersPage(tester);

      await tester.tap(find.byIcon(Icons.add));
      await pumpRoute(tester);

      expect(find.text('新增提醒'), findsOneWidget);
      expect(find.text('当前平台不支持关闭应用后的通知提醒'), findsOneWidget);

      await disposeApp(tester);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('keeps reminder enabled when offline scheduling is unsupported', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    try {
      notificationService.supportsOfflineScheduling = false;

      await openAddForm(tester);

      await tester.enterText(
        find.byKey(const Key('reminderTitleField')),
        '桌面提醒',
      );
      await tester.tap(find.byKey(const Key('scheduledAtField')));
      await pumpRoute(tester);
      await tester.tap(find.text('确定'));
      await pumpRoute(tester);
      await tester.tap(find.text('确定'));
      await pumpRoute(tester);
      await tester.tap(find.text('保存'));
      await pumpRoute(tester);

      final reminders = await database.remindersDao.getActive();
      expect(reminders, hasLength(1));
      expect(reminders.single.enabled, isTrue);
      expect(reminders.single.notificationId, isNotNull);
      expect(notificationService.permissionRequests, 1);
      expect(notificationService.scheduled, isEmpty);

      await disposeApp(tester);
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('shows English validation messages', (tester) async {
    await database.upsertSetting('localeOverride', 'en', DateTime.utc(2026));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(database),
          notificationServiceProvider.overrideWithValue(notificationService),
        ],
        child: const CardFanApp(),
      ),
    );
    await tester.tap(find.byIcon(Icons.notifications_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(find.text('Enter a reminder title'), findsOneWidget);
    expect(find.text('Choose a reminder time'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('validates reminder title and scheduled time', (tester) async {
    await openAddForm(tester);

    await tester.tap(find.text('保存'));
    await tester.pump();

    expect(find.text('请输入提醒标题'), findsOneWidget);
    expect(find.text('请选择提醒时间'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('creates an enabled reminder and schedules notification', (
    tester,
  ) async {
    await openAddForm(tester);

    await tester.enterText(find.byKey(const Key('reminderTitleField')), '续费提醒');
    await tester.enterText(find.byKey(const Key('reminderBodyField')), '检查套餐');
    await tester.tap(find.byKey(const Key('scheduledAtField')));
    await pumpRoute(tester);
    await tester.tap(find.text('确定'));
    await pumpRoute(tester);
    await tester.tap(find.text('确定'));
    await pumpRoute(tester);
    await tester.tap(find.text('保存'));
    await pumpRoute(tester);

    final reminders = await database.remindersDao.getActive();
    expect(reminders, hasLength(1));
    expect(reminders.single.title, '续费提醒');
    expect(reminders.single.body, '检查套餐');
    expect(reminders.single.enabled, isTrue);
    expect(reminders.single.notificationId, isNotNull);
    expect(notificationService.scheduled, hasLength(1));
    expect(notificationService.scheduled.single.title, '续费提醒');
    expect(notificationService.permissionRequests, 1);

    await disposeApp(tester);
  });

  testWidgets(
    'saves reminder disabled when notification permission is denied',
    (tester) async {
      notificationService.permissionsGranted = false;
      await openAddForm(tester);

      await tester.enterText(
        find.byKey(const Key('reminderTitleField')),
        '权限提醒',
      );
      await tester.tap(find.byKey(const Key('scheduledAtField')));
      await pumpRoute(tester);
      await tester.tap(find.text('确定'));
      await pumpRoute(tester);
      await tester.tap(find.text('确定'));
      await pumpRoute(tester);
      await tester.tap(find.text('保存'));
      await pumpRoute(tester);

      final reminders = await database.remindersDao.getActive();
      expect(reminders, hasLength(1));
      expect(reminders.single.enabled, isFalse);
      expect(reminders.single.notificationId, isNull);
      expect(notificationService.permissionRequests, 1);
      expect(notificationService.scheduled, isEmpty);

      await disposeApp(tester);
    },
  );

  testWidgets('default selected reminder time is saved in the future', (
    tester,
  ) async {
    await openAddForm(tester);

    await tester.enterText(
      find.byKey(const Key('reminderTitleField')),
      '当前时间提醒',
    );
    await tester.tap(find.byKey(const Key('scheduledAtField')));
    await pumpRoute(tester);
    await tester.tap(find.text('确定'));
    await pumpRoute(tester);
    await tester.tap(find.text('确定'));
    await pumpRoute(tester);
    await tester.tap(find.text('保存'));
    await pumpRoute(tester);

    final reminders = await database.remindersDao.getActive();
    final scheduledAt = reminders.single.scheduledAt;
    final notificationScheduledAt =
        notificationService.scheduled.single.scheduledAt;

    await disposeApp(tester);

    expect(scheduledAt.isAfter(DateTime.now().toUtc()), isTrue);
    expect(notificationScheduledAt.isAfter(DateTime.now().toUtc()), isTrue);
  });

  testWidgets('shows active reminders from the database', (tester) async {
    final now = DateTime.utc(2026, 5, 22);
    await database.remindersDao.create(
      RemindersCompanion.insert(
        id: 'reminder-1',
        title: '护照续签',
        body: const Value('准备材料'),
        scheduledAt: DateTime(2026, 6, 1, 9, 30),
        notificationId: const Value(11),
        createdAt: now,
        updatedAt: now,
      ),
    );

    await pumpRemindersPage(tester);

    expect(find.text('护照续签'), findsOneWidget);
    expect(find.textContaining('准备材料'), findsOneWidget);
    expect(find.textContaining('2026-06-01 09:30'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('prefills and updates an existing reminder', (tester) async {
    final now = DateTime.utc(2026, 5, 22);
    await database.remindersDao.create(
      RemindersCompanion.insert(
        id: 'reminder-1',
        title: '旧提醒',
        body: const Value('旧内容'),
        scheduledAt: DateTime(2026, 6, 1, 9, 30),
        notificationId: const Value(11),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await pumpRemindersPage(tester);

    await tester.tap(find.text('旧提醒'));
    await pumpRoute(tester);

    expect(find.text('编辑提醒'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, '旧提醒'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, '旧内容'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('reminderTitleField')), '新提醒');
    await tester.tap(find.byKey(const Key('reminderEnabledSwitch')));
    await tester.pump();
    await tester.tap(find.text('保存'));
    await pumpRoute(tester);

    final updated = await database.remindersDao.getById('reminder-1');
    expect(updated?.title, '新提醒');
    expect(updated?.enabled, isFalse);
    expect(updated?.syncStatus, 'pending');
    expect(notificationService.cancelled, contains(11));

    await disposeApp(tester);
  });

  testWidgets('soft deletes an existing reminder and cancels notification', (
    tester,
  ) async {
    final now = DateTime.utc(2026, 5, 22);
    await database.remindersDao.create(
      RemindersCompanion.insert(
        id: 'reminder-1',
        title: '护照续签',
        scheduledAt: DateTime(2026, 6, 1, 9, 30),
        notificationId: const Value(11),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await pumpRemindersPage(tester);

    await tester.tap(find.text('护照续签'));
    await pumpRoute(tester);
    await tester.tap(find.text('删除'));
    await pumpRoute(tester);
    await tester.tap(find.text('确认删除'));
    await pumpRoute(tester);

    expect(await database.remindersDao.getActive(), isEmpty);
    final deleted = await database.remindersDao.getById('reminder-1');
    expect(deleted?.deletedAt, isNotNull);
    expect(notificationService.cancelled, [11]);

    await disposeApp(tester);
  });
}

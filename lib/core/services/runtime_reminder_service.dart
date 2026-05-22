import 'dart:async';

import '../database/app_database.dart';
import '../database/daos/reminders_dao.dart';
import 'notification_scheduler.dart';

class RuntimeReminderService {
  RuntimeReminderService(
    this._dao,
    this._scheduler, {
    DateTime Function()? now,
    Duration checkInterval = const Duration(seconds: 30),
  }) : _now = now ?? (() => DateTime.now().toUtc()),
       _checkInterval = checkInterval;

  final RemindersDao _dao;
  final NotificationScheduler _scheduler;
  final DateTime Function() _now;
  final Duration _checkInterval;
  final _shownReminderKeys = <String>{};

  StreamSubscription<List<Reminder>>? _subscription;
  Timer? _timer;
  List<Reminder> _activeReminders = const [];
  Future<void>? _activeCheck;
  bool _checkAgain = false;

  void start() {
    _subscription ??= _dao.watchActive().listen((reminders) {
      _activeReminders = reminders;
      unawaited(checkDueReminders());
    });
    _timer ??= Timer.periodic(
      _checkInterval,
      (_) => unawaited(checkDueReminders()),
    );
  }

  Future<void> checkDueReminders() {
    final activeCheck = _activeCheck;
    if (activeCheck != null) {
      _checkAgain = true;
      return activeCheck;
    }

    return _activeCheck = _runDueReminderChecks();
  }

  Future<void> _runDueReminderChecks() async {
    try {
      do {
        _checkAgain = false;
        await _checkDueRemindersOnce();
      } while (_checkAgain);
    } finally {
      _activeCheck = null;
    }
  }

  Future<void> _checkDueRemindersOnce() async {
    _activeReminders = await _dao.getActive();
    final now = _now();
    final dueReminders = _activeReminders.where((reminder) {
      final reminderKey = _reminderKey(reminder);
      return reminder.enabled &&
          reminder.deletedAt == null &&
          !reminder.scheduledAt.isAfter(now) &&
          !_shownReminderKeys.contains(reminderKey);
    });

    for (final reminder in dueReminders) {
      _shownReminderKeys.add(_reminderKey(reminder));
      await _scheduler.showRuntimeReminder(reminder);
    }
  }

  String _reminderKey(Reminder reminder) {
    return '${reminder.id}|${reminder.scheduledAt.toUtc().toIso8601String()}';
  }

  Future<void> dispose() async {
    _timer?.cancel();
    _timer = null;
    await _subscription?.cancel();
    _subscription = null;
  }
}

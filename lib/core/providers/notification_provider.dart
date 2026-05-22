import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/notification_scheduler.dart';
import '../services/notification_service.dart';
import '../services/runtime_reminder_service.dart';
import 'database_provider.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return LocalNotificationService();
});

final notificationSchedulerProvider = Provider<NotificationScheduler>((ref) {
  return NotificationScheduler(ref.watch(notificationServiceProvider));
});

final runtimeReminderServiceProvider = Provider<RuntimeReminderService>((ref) {
  final notificationService = ref.watch(notificationServiceProvider);
  final service = RuntimeReminderService(
    ref.watch(remindersDaoProvider),
    ref.watch(notificationSchedulerProvider),
  );

  if (notificationService.supportsNotifications &&
      !notificationService.supportsOfflineScheduling) {
    service.start();
  }

  ref.onDispose(service.dispose);
  return service;
});

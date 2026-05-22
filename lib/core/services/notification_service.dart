import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

abstract interface class NotificationService {
  bool get supportsNotifications;

  bool get supportsOfflineScheduling;

  Future<bool> initialize();

  Future<bool> requestPermissions();

  Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledAt,
  });

  Future<void> show({
    required int id,
    required String title,
    required String body,
  });

  Future<void> cancel(int id);
}

class LocalNotificationService implements NotificationService {
  LocalNotificationService({FlutterLocalNotificationsPlugin? plugin})
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  static const _channel = AndroidNotificationChannel(
    'cardfan_reminders',
    'CardFan Reminders',
    description: 'Reminder notifications scheduled by CardFan.',
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  @override
  bool get supportsNotifications => supportsLocalNotifications;

  @override
  bool get supportsOfflineScheduling => supportsLocalNotificationScheduling;

  static bool get supportsLocalNotifications {
    if (kIsWeb) {
      return false;
    }

    return switch (defaultTargetPlatform) {
      TargetPlatform.android ||
      TargetPlatform.iOS ||
      TargetPlatform.macOS ||
      TargetPlatform.windows ||
      TargetPlatform.linux => true,
      TargetPlatform.fuchsia => false,
    };
  }

  static bool get supportsLocalNotificationScheduling {
    if (kIsWeb) {
      return false;
    }

    return switch (defaultTargetPlatform) {
      TargetPlatform.android ||
      TargetPlatform.iOS ||
      TargetPlatform.macOS ||
      TargetPlatform.windows => true,
      TargetPlatform.fuchsia || TargetPlatform.linux => false,
    };
  }

  @override
  Future<bool> initialize() async {
    if (!supportsNotifications) {
      return false;
    }

    if (_initialized) {
      return true;
    }

    tz.initializeTimeZones();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwin = DarwinInitializationSettings();
    const windows = WindowsInitializationSettings(
      appName: 'CardFan',
      appUserModelId: 'CardFan.CardFan',
      guid: '1df994a0-7c6b-4c16-9151-f3b1e5724d38',
    );
    const linux = LinuxInitializationSettings(defaultActionName: '打开');
    final initialized = await _plugin.initialize(
      settings: const InitializationSettings(
        android: android,
        iOS: darwin,
        macOS: darwin,
        linux: linux,
        windows: windows,
      ),
    );

    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(_channel);
    }

    _initialized = initialized ?? true;
    return _initialized;
  }

  @override
  Future<bool> requestPermissions() async {
    if (!supportsNotifications) {
      return false;
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      await initialize();
      return await _plugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.requestNotificationsPermission() ??
          true;
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      await initialize();
      return await _plugin
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >()
              ?.requestPermissions(alert: true, badge: true, sound: true) ??
          true;
    }

    if (defaultTargetPlatform == TargetPlatform.macOS) {
      await initialize();
      return await _plugin
              .resolvePlatformSpecificImplementation<
                MacOSFlutterLocalNotificationsPlugin
              >()
              ?.requestPermissions(alert: true, badge: true, sound: true) ??
          true;
    }

    return defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux;
  }

  @override
  Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledAt,
  }) async {
    if (!supportsOfflineScheduling) {
      return;
    }

    await initialize();
    try {
      await _schedule(
        id: id,
        title: title,
        body: body,
        scheduledAt: scheduledAt,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    } on PlatformException catch (error) {
      if (error.code != 'exact_alarms_not_permitted') {
        rethrow;
      }

      await _schedule(
        id: id,
        title: title,
        body: body,
        scheduledAt: scheduledAt,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      );
    }
  }

  Future<void> _schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledAt,
    required AndroidScheduleMode androidScheduleMode,
  }) async {
    await _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: tz.TZDateTime.from(scheduledAt.toLocal(), tz.local),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'cardfan_reminders',
          'CardFan Reminders',
          channelDescription: 'Reminder notifications scheduled by CardFan.',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
        macOS: DarwinNotificationDetails(),
        windows: WindowsNotificationDetails(),
      ),
      androidScheduleMode: androidScheduleMode,
    );
  }

  @override
  Future<void> show({
    required int id,
    required String title,
    required String body,
  }) async {
    if (!supportsNotifications) {
      return;
    }

    await initialize();
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'cardfan_reminders',
          'CardFan Reminders',
          channelDescription: 'Reminder notifications scheduled by CardFan.',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
        macOS: DarwinNotificationDetails(),
        linux: LinuxNotificationDetails(),
        windows: WindowsNotificationDetails(),
      ),
    );
  }

  @override
  Future<void> cancel(int id) async {
    if (!supportsNotifications) {
      return;
    }

    await initialize();
    await _plugin.cancel(id: id);
  }
}

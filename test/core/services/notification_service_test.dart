import 'dart:io';

import 'package:cardfan/core/services/notification_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('dexterous.com/flutter/local_notifications');
  final calls = <MethodCall>[];

  Future<Object?> handleNotificationCall(MethodCall methodCall) async {
    calls.add(methodCall);

    if (methodCall.method == 'initialize') {
      return true;
    }

    if (methodCall.method == 'requestPermissions') {
      return true;
    }

    if (methodCall.method == 'zonedSchedule') {
      final arguments = methodCall.arguments as Map<Object?, Object?>;
      final platformSpecifics =
          arguments['platformSpecifics'] as Map<Object?, Object?>;
      if (platformSpecifics['scheduleMode'] == 'exactAllowWhileIdle') {
        throw PlatformException(code: 'exact_alarms_not_permitted');
      }
    }

    return null;
  }

  setUp(() {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    AndroidFlutterLocalNotificationsPlugin.registerWith();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, handleNotificationCall);
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
    calls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test(
    'falls back to inexact Android scheduling when exact alarms are denied',
    () async {
      final service = LocalNotificationService();

      await service.schedule(
        id: 1,
        title: 'Pay rent',
        body: 'Before 6pm',
        scheduledAt: DateTime.now().add(const Duration(hours: 1)),
      );

      final scheduleModes = calls
          .where((call) => call.method == 'zonedSchedule')
          .map((call) {
            final arguments = call.arguments as Map<Object?, Object?>;
            final platformSpecifics =
                arguments['platformSpecifics'] as Map<Object?, Object?>;
            return platformSpecifics['scheduleMode'];
          })
          .toList();

      expect(scheduleModes, ['exactAllowWhileIdle', 'inexactAllowWhileIdle']);
    },
  );

  test('initializes successfully on macOS', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    MacOSFlutterLocalNotificationsPlugin.registerWith();
    final service = LocalNotificationService();

    await service.initialize();

    expect(calls.map((call) => call.method), contains('initialize'));
    expect(
      calls.map((call) => call.method),
      isNot(contains('createNotificationChannel')),
    );
  });

  test('requests permissions through the macOS plugin on macOS', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    MacOSFlutterLocalNotificationsPlugin.registerWith();

    final service = LocalNotificationService();

    final result = await service.requestPermissions();

    expect(result, isTrue);
    expect(calls.any((call) => call.method == 'requestPermissions'), isTrue);
  });

  test(
    'reports Linux notification support without offline scheduling support',
    () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      final service = LocalNotificationService();

      final result = await service.requestPermissions();

      expect(service.supportsNotifications, isTrue);
      expect(service.supportsOfflineScheduling, isFalse);
      expect(result, isTrue);
    },
  );

  test('initializes Linux notifications for runtime use', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    final service = LocalNotificationService();

    final result = await service.initialize();

    expect(result, isTrue);
  });

  test('schedule is a no-op but cancel still initializes on Linux', () async {
    debugDefaultTargetPlatformOverride = TargetPlatform.linux;
    // Use a fake Linux plugin because Linux initialization does not use MethodChannel.
    final previousInstance = FlutterLocalNotificationsPlatform.instance;
    addTearDown(
      () => FlutterLocalNotificationsPlatform.instance = previousInstance,
    );
    FlutterLocalNotificationsPlatform.instance = _FakeLinuxNotificationsPlugin(
      calls,
    );
    final service = LocalNotificationService();

    await service.schedule(
      id: 1,
      title: 'Pay rent',
      body: 'Before 6pm',
      scheduledAt: DateTime(2026, 5, 23, 10),
    );
    await service.cancel(1);

    final methodNames = calls.map((call) => call.method).toList();

    expect(methodNames, isNot(contains('zonedSchedule')));
    expect(methodNames, contains('initialize'));
    expect(methodNames, contains('cancel'));
  });

  test('Android manifest declares scheduled notification components', () {
    final manifest = File(
      'android/app/src/main/AndroidManifest.xml',
    ).readAsStringSync();

    expect(manifest, contains('android.permission.RECEIVE_BOOT_COMPLETED'));
    expect(
      manifest,
      contains(
        'com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver',
      ),
    );
    expect(
      manifest,
      contains(
        'com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver',
      ),
    );
  });
}

class _FakeLinuxNotificationsPlugin
    extends LinuxFlutterLocalNotificationsPlugin {
  _FakeLinuxNotificationsPlugin(this.calls);

  final List<MethodCall> calls;

  @override
  Future<bool?> initialize({
    required LinuxInitializationSettings settings,
    DidReceiveNotificationResponseCallback? onDidReceiveNotificationResponse,
  }) async {
    calls.add(const MethodCall('initialize'));
    return true;
  }

  @override
  Future<void> cancel({required int id}) async {
    calls.add(const MethodCall('cancel'));
  }
}

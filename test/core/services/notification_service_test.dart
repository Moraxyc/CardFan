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
        scheduledAt: DateTime(2026, 5, 23, 10),
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
    'does not report permissions granted on unsupported platforms',
    () async {
      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      final service = LocalNotificationService();

      final result = await service.requestPermissions();

      expect(result, isFalse);
    },
  );

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

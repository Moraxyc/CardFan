import 'dart:io';

import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/database/database_key_store.dart';
import 'package:cardfan/core/providers/database_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  group('sim cards', () {
    test('inserts, updates, soft-deletes, and watches active rows', () async {
      final createdAt = DateTime.utc(2026, 1, 1);
      final updatedAt = DateTime.utc(2026, 1, 2);

      await database.simCardsDao.create(
        SimCardsCompanion.insert(
          id: 'sim-1',
          carrierName: 'Mint Mobile',
          phoneNumber: '5551234567',
          createdAt: createdAt,
          updatedAt: createdAt,
        ),
      );

      final activeBeforeDelete = await database.simCardsDao.watchActive().first;
      expect(activeBeforeDelete, hasLength(1));
      expect(activeBeforeDelete.single.carrierName, 'Mint Mobile');

      await database.simCardsDao.updateRecord(
        SimCardsCompanion(
          id: const Value('sim-1'),
          carrierName: const Value('T-Mobile'),
          monthlyFeeCents: const Value(1500),
          billingDay: const Value(15),
          updatedAt: Value(updatedAt),
        ),
      );

      final updated = await database.simCardsDao.getById('sim-1');
      expect(updated?.carrierName, 'T-Mobile');
      expect(updated?.monthlyFeeCents, 1500);
      expect(updated?.billingDay, 15);
      expect(updated?.syncStatus, 'pending');

      await database.simCardsDao.softDelete('sim-1', updatedAt);

      expect(await database.simCardsDao.watchActive().first, isEmpty);
      final deleted = await database.simCardsDao.getById('sim-1');
      expect(deleted?.deletedAt?.isAtSameMomentAs(updatedAt), isTrue);
      expect(deleted?.syncStatus, 'pending');
    });
  });

  group('bank cards', () {
    test('inserts, updates, soft-deletes, and watches active rows', () async {
      final createdAt = DateTime.utc(2026, 2, 1);
      final updatedAt = DateTime.utc(2026, 2, 2);

      await database.bankCardsDao.create(
        BankCardsCompanion.insert(
          id: 'bank-1',
          bankName: 'Acme Bank',
          lastFourDigits: '1234',
          createdAt: createdAt,
          updatedAt: createdAt,
        ),
      );

      final activeBeforeDelete = await database.bankCardsDao
          .watchActive()
          .first;
      expect(activeBeforeDelete, hasLength(1));
      expect(activeBeforeDelete.single.bankName, 'Acme Bank');

      await database.bankCardsDao.updateRecord(
        BankCardsCompanion(
          id: const Value('bank-1'),
          cardName: const Value('Rewards'),
          paymentDueDay: const Value(20),
          creditLimitCents: const Value(500000),
          updatedAt: Value(updatedAt),
        ),
      );

      final updated = await database.bankCardsDao.getById('bank-1');
      expect(updated?.cardName, 'Rewards');
      expect(updated?.paymentDueDay, 20);
      expect(updated?.creditLimitCents, 500000);
      expect(updated?.syncStatus, 'pending');

      await database.bankCardsDao.softDelete('bank-1', updatedAt);

      expect(await database.bankCardsDao.watchActive().first, isEmpty);
      final deleted = await database.bankCardsDao.getById('bank-1');
      expect(deleted?.deletedAt?.isAtSameMomentAs(updatedAt), isTrue);
      expect(deleted?.syncStatus, 'pending');
    });
  });

  group('reminders', () {
    test('inserts, updates, soft-deletes, and watches active rows', () async {
      final createdAt = DateTime.utc(2026, 4, 1);
      final updatedAt = DateTime.utc(2026, 4, 2);

      await database.remindersDao.create(
        RemindersCompanion.insert(
          id: 'reminder-1',
          title: 'Pay phone bill',
          scheduledAt: DateTime.utc(2026, 4, 14, 9),
          createdAt: createdAt,
          updatedAt: createdAt,
        ),
      );

      final activeBeforeDelete = await database.remindersDao
          .watchActive()
          .first;
      expect(activeBeforeDelete, hasLength(1));
      expect(activeBeforeDelete.single.enabled, isTrue);

      await database.remindersDao.updateRecord(
        RemindersCompanion(
          id: const Value('reminder-1'),
          enabled: const Value(false),
          notificationId: const Value(42),
          updatedAt: Value(updatedAt),
        ),
      );

      final updated = await database.remindersDao.getById('reminder-1');
      expect(updated?.enabled, isFalse);
      expect(updated?.notificationId, 42);
      expect(updated?.syncStatus, 'pending');

      await database.remindersDao.softDelete('reminder-1', updatedAt);

      expect(await database.remindersDao.watchActive().first, isEmpty);
      final deleted = await database.remindersDao.getById('reminder-1');
      expect(deleted?.deletedAt?.isAtSameMomentAs(updatedAt), isTrue);
      expect(deleted?.syncStatus, 'pending');
    });
  });

  group('settings and sync records', () {
    test('upserts app settings and sync records', () async {
      final now = DateTime.utc(2026, 5, 1);

      await database.upsertSetting('notifications.enabled', 'true', now);
      await database.upsertSetting('notifications.enabled', 'false', now);

      final setting = await database.settingByKey('notifications.enabled');
      expect(setting?.value, 'false');

      await database.upsertSyncRecord(
        SyncRecordsCompanion.insert(
          id: 'sync-1',
          entityType: 'sim_card',
          entityId: 'sim-1',
          operation: 'upsert',
          createdAt: now,
          updatedAt: now,
        ),
      );
      await database.upsertSyncRecord(
        SyncRecordsCompanion(
          id: const Value('sync-1'),
          status: const Value('failed'),
          attemptCount: const Value(1),
          lastError: const Value('network'),
          updatedAt: Value(now.add(const Duration(minutes: 1))),
        ),
      );

      final pending = await database.watchPendingSyncRecords().first;
      expect(pending, isEmpty);
      final failed = await database.syncRecordById('sync-1');
      expect(failed?.status, 'failed');
      expect(failed?.attemptCount, 1);
      expect(failed?.lastError, 'network');
    });
  });

  test('databaseProvider can be overridden in tests', () {
    final container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(database)],
    );
    addTearDown(container.dispose);

    expect(container.read(databaseProvider), same(database));
    expect(container.read(simCardsDaoProvider), same(database.simCardsDao));
    expect(container.read(bankCardsDaoProvider), same(database.bankCardsDao));
    expect(container.read(remindersDaoProvider), same(database.remindersDao));
  });

  group('getByPhoneNumber', () {
    test(
      'returns earliest createdAt when duplicate phone numbers exist',
      () async {
        final earlier = DateTime.utc(2026, 6, 1);
        final later = DateTime.utc(2026, 6, 2);

        // Insert the later row first to ensure ordering is not just insertion order.
        await database.simCardsDao.create(
          SimCardsCompanion.insert(
            id: 'sim-dup-later',
            carrierName: 'Carrier Later',
            phoneNumber: '5550001111',
            createdAt: later,
            updatedAt: later,
          ),
        );
        await database.simCardsDao.create(
          SimCardsCompanion.insert(
            id: 'sim-dup-earlier',
            carrierName: 'Carrier Earlier',
            phoneNumber: '5550001111',
            createdAt: earlier,
            updatedAt: earlier,
          ),
        );

        final result = await database.simCardsDao.getByPhoneNumber(
          '5550001111',
        );
        expect(result?.id, 'sim-dup-earlier');
        expect(result?.carrierName, 'Carrier Earlier');
      },
    );

    test('tiebreaks on id when createdAt is identical', () async {
      final createdAt = DateTime.utc(2026, 6, 1);

      await database.simCardsDao.create(
        SimCardsCompanion.insert(
          id: 'sim-dup-b',
          carrierName: 'Carrier B',
          phoneNumber: '5550002222',
          createdAt: createdAt,
          updatedAt: createdAt,
        ),
      );
      await database.simCardsDao.create(
        SimCardsCompanion.insert(
          id: 'sim-dup-a',
          carrierName: 'Carrier A',
          phoneNumber: '5550002222',
          createdAt: createdAt,
          updatedAt: createdAt,
        ),
      );

      final result = await database.simCardsDao.getByPhoneNumber('5550002222');
      expect(result?.id, 'sim-dup-a');
    });
  });

  group('encrypted file database', () {
    test(
      'does not expose sensitive values in raw file content and supports queries after reopen',
      () async {
        final tempDir = await Directory.systemTemp.createTemp(
          'cardfan_encrypted_db_test_',
        );
        addTearDown(() async {
          if (await tempDir.exists()) {
            await tempDir.delete(recursive: true);
          }
        });

        final keyStore = FakeDatabaseKeyStore(List<int>.filled(32, 3));
        final firstDatabase = AppDatabase.withKeyStore(
          databaseKeyStore: keyStore,
          databaseFile: File('${tempDir.path}/cardfan.sqlite'),
        );
        addTearDown(firstDatabase.close);

        await firstDatabase.simCardsDao.create(
          SimCardsCompanion.insert(
            id: 'sim-sensitive',
            carrierName: 'Sensitive Carrier',
            phoneNumber: '15551234567',
            notes: const Value('secret sim pin 1234'),
            createdAt: DateTime.utc(2026, 5, 23),
            updatedAt: DateTime.utc(2026, 5, 23),
          ),
        );
        await firstDatabase.bankCardsDao.create(
          BankCardsCompanion.insert(
            id: 'bank-sensitive',
            bankName: 'Sensitive Bank',
            lastFourDigits: '9876',
            notes: const Value('secret cvv 999'),
            createdAt: DateTime.utc(2026, 5, 23),
            updatedAt: DateTime.utc(2026, 5, 23),
          ),
        );
        await firstDatabase.close();

        // Scan every file Drift/SQLite may have produced (main db, -wal, -shm,
        // -journal), not just the main file, so a regression that leaves
        // plaintext in a sidecar is caught.
        const secrets = [
          '15551234567',
          'Sensitive Carrier',
          'Sensitive Bank',
          'secret sim pin 1234',
          'secret cvv 999',
        ];
        final tempEntities = await tempDir.list().toList();
        final tempFiles = tempEntities.whereType<File>().toList();
        expect(tempFiles, isNotEmpty);
        for (final entity in tempFiles) {
          final bytes = await entity.readAsBytes();
          final content = String.fromCharCodes(bytes);
          for (final secret in secrets) {
            expect(
              content,
              isNot(contains(secret)),
              reason: '${entity.path} contains plaintext "$secret"',
            );
          }
        }

        final reopenedDatabase = AppDatabase.withKeyStore(
          databaseKeyStore: keyStore,
          databaseFile: File('${tempDir.path}/cardfan.sqlite'),
        );
        addTearDown(reopenedDatabase.close);

        final matchingSim = await reopenedDatabase.simCardsDao.getByPhoneNumber(
          '15551234567',
        );
        expect(matchingSim?.carrierName, 'Sensitive Carrier');
      },
    );
  });
}

class FakeDatabaseKeyStore implements DatabaseKeyStore {
  FakeDatabaseKeyStore(this.key);

  final List<int> key;

  @override
  Future<List<int>> readOrCreateDatabaseKey() async => key;
}

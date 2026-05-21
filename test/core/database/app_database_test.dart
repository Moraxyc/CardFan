import 'package:cardfan/core/database/app_database.dart';
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

  group('bills', () {
    test('rejects missing card and sim references', () async {
      final createdAt = DateTime.utc(2026, 3, 1);

      expect(
        () => database.billsDao.create(
          BillsCompanion.insert(
            id: 'bill-1',
            title: 'Phone bill',
            amountCents: 4500,
            dueDate: DateTime.utc(2026, 3, 15),
            bankCardId: const Value('missing-bank'),
            simCardId: const Value('missing-sim'),
            createdAt: createdAt,
            updatedAt: createdAt,
          ),
        ),
        throwsA(isA<SqliteException>()),
      );
    });

    test(
      'inserts, links, updates, soft-deletes, and watches active rows',
      () async {
        final createdAt = DateTime.utc(2026, 3, 1);
        final updatedAt = DateTime.utc(2026, 3, 2);

        await database.simCardsDao.create(
          SimCardsCompanion.insert(
            id: 'sim-1',
            carrierName: 'Mint Mobile',
            phoneNumber: '5551234567',
            createdAt: createdAt,
            updatedAt: createdAt,
          ),
        );
        await database.bankCardsDao.create(
          BankCardsCompanion.insert(
            id: 'bank-1',
            bankName: 'Acme Bank',
            lastFourDigits: '1234',
            createdAt: createdAt,
            updatedAt: createdAt,
          ),
        );

        await database.billsDao.create(
          BillsCompanion.insert(
            id: 'bill-1',
            title: 'Phone bill',
            amountCents: 4500,
            dueDate: DateTime.utc(2026, 3, 15),
            bankCardId: const Value('bank-1'),
            simCardId: const Value('sim-1'),
            createdAt: createdAt,
            updatedAt: createdAt,
          ),
        );

        final activeBeforeDelete = await database.billsDao.watchActive().first;
        expect(activeBeforeDelete, hasLength(1));
        expect(activeBeforeDelete.single.bankCardId, 'bank-1');
        expect(activeBeforeDelete.single.simCardId, 'sim-1');

        await database.billsDao.updateRecord(
          BillsCompanion(
            id: const Value('bill-1'),
            paidAt: Value(DateTime.utc(2026, 3, 10)),
            updatedAt: Value(updatedAt),
          ),
        );

        final updated = await database.billsDao.getById('bill-1');
        expect(
          updated?.paidAt?.isAtSameMomentAs(DateTime.utc(2026, 3, 10)),
          isTrue,
        );
        expect(updated?.syncStatus, 'pending');

        await database.billsDao.softDelete('bill-1', updatedAt);

        expect(await database.billsDao.watchActive().first, isEmpty);
        final deleted = await database.billsDao.getById('bill-1');
        expect(deleted?.deletedAt?.isAtSameMomentAs(updatedAt), isTrue);
        expect(deleted?.syncStatus, 'pending');
      },
    );
  });

  group('reminders', () {
    test(
      'inserts, links, updates, soft-deletes, and watches active rows',
      () async {
        final createdAt = DateTime.utc(2026, 4, 1);
        final updatedAt = DateTime.utc(2026, 4, 2);

        await database.billsDao.create(
          BillsCompanion.insert(
            id: 'bill-1',
            title: 'Phone bill',
            amountCents: 4500,
            dueDate: DateTime.utc(2026, 4, 15),
            createdAt: createdAt,
            updatedAt: createdAt,
          ),
        );

        await database.remindersDao.create(
          RemindersCompanion.insert(
            id: 'reminder-1',
            title: 'Pay phone bill',
            scheduledAt: DateTime.utc(2026, 4, 14, 9),
            relatedBillId: const Value('bill-1'),
            createdAt: createdAt,
            updatedAt: createdAt,
          ),
        );

        final activeBeforeDelete = await database.remindersDao
            .watchActive()
            .first;
        expect(activeBeforeDelete, hasLength(1));
        expect(activeBeforeDelete.single.relatedBillId, 'bill-1');
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
      },
    );
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
    expect(container.read(billsDaoProvider), same(database.billsDao));
    expect(container.read(remindersDaoProvider), same(database.remindersDao));
  });
}

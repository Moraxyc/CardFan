import 'dart:io';

import 'package:cardfan/core/database/daos/bank_cards_dao.dart';
import 'package:cardfan/core/database/daos/reminders_dao.dart';
import 'package:cardfan/core/database/daos/sim_cards_dao.dart';
import 'package:cardfan/core/database/tables/app_settings.dart';
import 'package:cardfan/core/database/tables/bank_cards.dart';
import 'package:cardfan/core/database/tables/reminders.dart';
import 'package:cardfan/core/database/tables/sim_cards.dart';
import 'package:cardfan/core/database/tables/sync_records.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [SimCards, BankCards, Reminders, AppSettings, SyncRecords],
  daos: [SimCardsDao, BankCardsDao, RemindersDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (_) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  Future<void> upsertSetting(String key, String value, DateTime updatedAt) {
    return into(appSettings).insertOnConflictUpdate(
      AppSettingsCompanion.insert(key: key, value: value, updatedAt: updatedAt),
    );
  }

  Future<AppSetting?> settingByKey(String key) {
    return (select(
      appSettings,
    )..where((row) => row.key.equals(key))).getSingleOrNull();
  }

  Future<void> upsertSyncRecord(SyncRecordsCompanion entry) async {
    if (!entry.id.present) {
      throw ArgumentError.value(entry, 'entry', 'Sync record id is required');
    }

    await transaction(() async {
      // Update first so partial companions don't need insert-only required fields.
      final updatedRows = await (update(
        syncRecords,
      )..where((row) => row.id.equals(entry.id.value))).write(entry);

      if (updatedRows == 0) {
        await into(syncRecords).insert(entry);
      }
    });
  }

  Future<SyncRecord?> syncRecordById(String id) {
    return (select(
      syncRecords,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
  }

  Stream<List<SyncRecord>> watchPendingSyncRecords() {
    return (select(
      syncRecords,
    )..where((row) => row.status.equals('pending'))).watch();
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationSupportDirectory();
    await dir.create(recursive: true);

    final file = File(p.join(dir.path, 'cardfan.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

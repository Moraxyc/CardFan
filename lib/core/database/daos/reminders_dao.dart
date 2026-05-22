import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/database/tables/reminders.dart';
import 'package:drift/drift.dart';

part 'reminders_dao.g.dart';

@DriftAccessor(tables: [Reminders])
class RemindersDao extends DatabaseAccessor<AppDatabase>
    with _$RemindersDaoMixin {
  RemindersDao(super.db);

  Future<void> create(RemindersCompanion entry) =>
      into(reminders).insert(entry);

  Future<Reminder?> getById(String id) =>
      (select(reminders)..where((row) => row.id.equals(id))).getSingleOrNull();

  Stream<List<Reminder>> watchActive() =>
      (select(reminders)..where((row) => row.deletedAt.isNull())).watch();

  Future<List<Reminder>> getActive() =>
      (select(reminders)..where((row) => row.deletedAt.isNull())).get();

  Future<void> updateRecord(RemindersCompanion entry) {
    final id = entry.id.value;
    return (update(reminders)..where((row) => row.id.equals(id))).write(
      entry.copyWith(syncStatus: const Value('pending')),
    );
  }

  Future<void> softDelete(String id, DateTime deletedAt) {
    return (update(reminders)..where((row) => row.id.equals(id))).write(
      RemindersCompanion(
        deletedAt: Value(deletedAt),
        updatedAt: Value(deletedAt),
        syncStatus: const Value('pending'),
      ),
    );
  }
}

import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/database/tables/bills.dart';
import 'package:drift/drift.dart';

part 'bills_dao.g.dart';

@DriftAccessor(tables: [Bills])
class BillsDao extends DatabaseAccessor<AppDatabase> with _$BillsDaoMixin {
  BillsDao(super.db);

  Future<void> create(BillsCompanion entry) => into(bills).insert(entry);

  Future<Bill?> getById(String id) =>
      (select(bills)..where((row) => row.id.equals(id))).getSingleOrNull();

  Stream<List<Bill>> watchActive() =>
      (select(bills)..where((row) => row.deletedAt.isNull())).watch();

  Future<void> updateRecord(BillsCompanion entry) {
    final id = entry.id.value;
    return (update(bills)..where((row) => row.id.equals(id))).write(
      entry.copyWith(syncStatus: const Value('pending')),
    );
  }

  Future<void> softDelete(String id, DateTime deletedAt) {
    return (update(bills)..where((row) => row.id.equals(id))).write(
      BillsCompanion(
        deletedAt: Value(deletedAt),
        updatedAt: Value(deletedAt),
        syncStatus: const Value('pending'),
      ),
    );
  }
}

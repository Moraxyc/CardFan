import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/database/tables/sim_cards.dart';
import 'package:drift/drift.dart';

part 'sim_cards_dao.g.dart';

@DriftAccessor(tables: [SimCards])
class SimCardsDao extends DatabaseAccessor<AppDatabase>
    with _$SimCardsDaoMixin {
  SimCardsDao(super.db);

  Future<void> create(SimCardsCompanion entry) => into(simCards).insert(entry);

  Future<SimCard?> getById(String id) =>
      (select(simCards)..where((row) => row.id.equals(id))).getSingleOrNull();

  Stream<List<SimCard>> watchActive() =>
      (select(simCards)..where((row) => row.deletedAt.isNull())).watch();

  Future<void> updateRecord(SimCardsCompanion entry) {
    final id = entry.id.value;
    return (update(simCards)..where((row) => row.id.equals(id))).write(
      entry.copyWith(syncStatus: const Value('pending')),
    );
  }

  Future<void> softDelete(String id, DateTime deletedAt) {
    return (update(simCards)..where((row) => row.id.equals(id))).write(
      SimCardsCompanion(
        deletedAt: Value(deletedAt),
        updatedAt: Value(deletedAt),
        syncStatus: const Value('pending'),
      ),
    );
  }
}

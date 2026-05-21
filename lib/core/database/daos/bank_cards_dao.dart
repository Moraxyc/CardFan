import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/database/tables/bank_cards.dart';
import 'package:drift/drift.dart';

part 'bank_cards_dao.g.dart';

@DriftAccessor(tables: [BankCards])
class BankCardsDao extends DatabaseAccessor<AppDatabase>
    with _$BankCardsDaoMixin {
  BankCardsDao(super.db);

  Future<void> create(BankCardsCompanion entry) =>
      into(bankCards).insert(entry);

  Future<BankCard?> getById(String id) =>
      (select(bankCards)..where((row) => row.id.equals(id))).getSingleOrNull();

  Stream<List<BankCard>> watchActive() =>
      (select(bankCards)..where((row) => row.deletedAt.isNull())).watch();

  Future<List<BankCard>> getActive() =>
      (select(bankCards)..where((row) => row.deletedAt.isNull())).get();

  Future<void> updateRecord(BankCardsCompanion entry) {
    final id = entry.id.value;
    return (update(bankCards)..where((row) => row.id.equals(id))).write(
      entry.copyWith(syncStatus: const Value('pending')),
    );
  }

  Future<void> softDelete(String id, DateTime deletedAt) {
    return (update(bankCards)..where((row) => row.id.equals(id))).write(
      BankCardsCompanion(
        deletedAt: Value(deletedAt),
        updatedAt: Value(deletedAt),
        syncStatus: const Value('pending'),
      ),
    );
  }
}

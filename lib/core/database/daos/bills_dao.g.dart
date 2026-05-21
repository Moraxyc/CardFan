// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bills_dao.dart';

// ignore_for_file: type=lint
mixin _$BillsDaoMixin on DatabaseAccessor<AppDatabase> {
  $BankCardsTable get bankCards => attachedDatabase.bankCards;
  $SimCardsTable get simCards => attachedDatabase.simCards;
  $BillsTable get bills => attachedDatabase.bills;
  BillsDaoManager get managers => BillsDaoManager(this);
}

class BillsDaoManager {
  final _$BillsDaoMixin _db;
  BillsDaoManager(this._db);
  $$BankCardsTableTableManager get bankCards =>
      $$BankCardsTableTableManager(_db.attachedDatabase, _db.bankCards);
  $$SimCardsTableTableManager get simCards =>
      $$SimCardsTableTableManager(_db.attachedDatabase, _db.simCards);
  $$BillsTableTableManager get bills =>
      $$BillsTableTableManager(_db.attachedDatabase, _db.bills);
}

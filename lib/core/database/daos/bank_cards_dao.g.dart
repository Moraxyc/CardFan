// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_cards_dao.dart';

// ignore_for_file: type=lint
mixin _$BankCardsDaoMixin on DatabaseAccessor<AppDatabase> {
  $BankCardsTable get bankCards => attachedDatabase.bankCards;
  BankCardsDaoManager get managers => BankCardsDaoManager(this);
}

class BankCardsDaoManager {
  final _$BankCardsDaoMixin _db;
  BankCardsDaoManager(this._db);
  $$BankCardsTableTableManager get bankCards =>
      $$BankCardsTableTableManager(_db.attachedDatabase, _db.bankCards);
}

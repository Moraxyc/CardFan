// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sim_cards_dao.dart';

// ignore_for_file: type=lint
mixin _$SimCardsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SimCardsTable get simCards => attachedDatabase.simCards;
  SimCardsDaoManager get managers => SimCardsDaoManager(this);
}

class SimCardsDaoManager {
  final _$SimCardsDaoMixin _db;
  SimCardsDaoManager(this._db);
  $$SimCardsTableTableManager get simCards =>
      $$SimCardsTableTableManager(_db.attachedDatabase, _db.simCards);
}

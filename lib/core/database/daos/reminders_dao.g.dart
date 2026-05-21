// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_dao.dart';

// ignore_for_file: type=lint
mixin _$RemindersDaoMixin on DatabaseAccessor<AppDatabase> {
  $BankCardsTable get bankCards => attachedDatabase.bankCards;
  $SimCardsTable get simCards => attachedDatabase.simCards;
  $BillsTable get bills => attachedDatabase.bills;
  $RemindersTable get reminders => attachedDatabase.reminders;
  RemindersDaoManager get managers => RemindersDaoManager(this);
}

class RemindersDaoManager {
  final _$RemindersDaoMixin _db;
  RemindersDaoManager(this._db);
  $$BankCardsTableTableManager get bankCards =>
      $$BankCardsTableTableManager(_db.attachedDatabase, _db.bankCards);
  $$SimCardsTableTableManager get simCards =>
      $$SimCardsTableTableManager(_db.attachedDatabase, _db.simCards);
  $$BillsTableTableManager get bills =>
      $$BillsTableTableManager(_db.attachedDatabase, _db.bills);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db.attachedDatabase, _db.reminders);
}

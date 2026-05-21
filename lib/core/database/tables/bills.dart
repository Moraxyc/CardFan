import 'package:cardfan/core/database/tables/bank_cards.dart';
import 'package:cardfan/core/database/tables/sim_cards.dart';
import 'package:drift/drift.dart';

class Bills extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get amountCents => integer()();
  DateTimeColumn get dueDate => dateTime()();
  DateTimeColumn get paidAt => dateTime().nullable()();
  TextColumn get bankCardId => text().nullable().references(
    BankCards,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get simCardId => text().nullable().references(
    SimCards,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

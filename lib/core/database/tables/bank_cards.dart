import 'package:drift/drift.dart';

class BankCards extends Table {
  TextColumn get id => text()();
  TextColumn get bankName => text()();
  TextColumn get cardName => text().nullable()();
  TextColumn get lastFourDigits => text()();
  IntColumn get statementDay => integer().nullable()();
  IntColumn get paymentDueDay => integer().nullable()();
  IntColumn get creditLimitCents => integer().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

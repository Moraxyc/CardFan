import 'package:drift/drift.dart';

class SimCards extends Table {
  TextColumn get id => text()();
  TextColumn get carrierName => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get planName => text().nullable()();
  IntColumn get monthlyFeeCents => integer().nullable()();
  IntColumn get billingDay => integer().nullable()();
  DateTimeColumn get renewalDate => dateTime().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  TextColumn get remoteId => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

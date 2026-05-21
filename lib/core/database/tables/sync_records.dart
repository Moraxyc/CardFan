import 'package:drift/drift.dart';

class SyncRecords extends Table {
  TextColumn get id => text()();
  TextColumn get entityType => text()();
  TextColumn get entityId => text()();
  TextColumn get remoteId => text().nullable()();
  TextColumn get operation => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get attemptCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

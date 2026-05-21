import 'package:cardfan/core/database/daos/bank_cards_dao.dart';
import 'package:cardfan/core/database/daos/reminders_dao.dart';
import 'package:cardfan/core/database/daos/sim_cards_dao.dart';
import 'package:cardfan/core/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final simCardsDaoProvider = Provider<SimCardsDao>((ref) {
  return ref.watch(databaseProvider).simCardsDao;
});

final bankCardsDaoProvider = Provider<BankCardsDao>((ref) {
  return ref.watch(databaseProvider).bankCardsDao;
});

final remindersDaoProvider = Provider<RemindersDao>((ref) {
  return ref.watch(databaseProvider).remindersDao;
});

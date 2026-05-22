import 'package:cardfan/app.dart';
import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/providers/database_provider.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  Future<void> pumpDashboard(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const CardFanApp(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> disposeApp(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  }

  testWidgets('shows useful empty dashboard actions without bills', (
    tester,
  ) async {
    await pumpDashboard(tester);

    expect(find.text('No cards yet'), findsOneWidget);
    expect(find.text('Add SIM Card'), findsOneWidget);
    expect(find.text('Add Bank Card'), findsOneWidget);
    expect(find.text('0 张 SIM 卡'), findsNothing);
    expect(find.text('0 张银行卡'), findsNothing);
    expect(find.text('中国移动 SIM 卡'), findsNothing);
    expect(find.text('招商银行信用卡'), findsNothing);

    await disposeApp(tester);
  });

  testWidgets('summarizes active SIM cards and bank cards from local data', (
    tester,
  ) async {
    final now = DateTime.utc(2026, 5, 21);
    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'sim-1',
        carrierName: '中国移动',
        phoneNumber: '+886912345678',
        billingDay: const Value(25),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'sim-2',
        carrierName: '中华电信',
        phoneNumber: '+886923456789',
        billingDay: const Value(10),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'deleted-sim',
        carrierName: '已删除电信',
        phoneNumber: '+886934567890',
        billingDay: const Value(5),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await database.simCardsDao.softDelete('deleted-sim', now);
    await database.bankCardsDao.create(
      BankCardsCompanion.insert(
        id: 'bank-1',
        bankName: '招商银行',
        lastFourDigits: '1234',
        statementDay: const Value(8),
        paymentDueDay: const Value(18),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await database.bankCardsDao.create(
      BankCardsCompanion.insert(
        id: 'deleted-bank',
        bankName: '已删除银行',
        lastFourDigits: '9876',
        paymentDueDay: const Value(3),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await database.bankCardsDao.softDelete('deleted-bank', now);

    await pumpDashboard(tester);

    expect(find.text('SIM Cards'), findsOneWidget);
    expect(find.text('2 SIM cards'), findsOneWidget);
    expect(find.text('Renews on day 10 each month'), findsOneWidget);
    expect(find.text('1 bank card'), findsOneWidget);
    expect(find.text('Payment due on day 18 each month'), findsOneWidget);
    expect(find.text('已删除电信'), findsNothing);
    expect(find.text('已删除银行'), findsNothing);
    expect(find.text('未记录账单'), findsNothing);

    await disposeApp(tester);
  });

  testWidgets('renders English SIM card plural', (tester) async {
    final now = DateTime.utc(2026);
    await database.upsertSetting('localeOverride', 'en', now);

    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'sim-1',
        carrierName: 'Carrier A',
        phoneNumber: '+15551234567',
        createdAt: now,
        updatedAt: now,
      ),
    );
    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'sim-2',
        carrierName: 'Carrier B',
        phoneNumber: '+15557654321',
        createdAt: now,
        updatedAt: now,
      ),
    );

    await pumpDashboard(tester);

    expect(find.text('2 SIM cards'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('updates dashboard when local data changes', (tester) async {
    final now = DateTime.utc(2026, 5, 21);
    await pumpDashboard(tester);

    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'sim-1',
        carrierName: '中国移动',
        phoneNumber: '+886912345678',
        createdAt: now,
        updatedAt: now,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('1 SIM card'), findsOneWidget);
    expect(find.text('No renewal day set'), findsOneWidget);

    await disposeApp(tester);
  });
}

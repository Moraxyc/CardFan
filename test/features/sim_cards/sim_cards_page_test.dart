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

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    await database.upsertSetting(
      'localeOverride',
      'zh-Hans',
      DateTime.utc(2026),
    );
  });

  tearDown(() async {
    await database.close();
  });

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const CardFanApp(),
      ),
    );
    await tester.tap(find.text('SIM'));
    await tester.pumpAndSettle();
  }

  Future<void> disposeApp(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  }

  testWidgets('shows an empty SIM card list', (tester) async {
    await pumpApp(tester);

    expect(find.text('还没有 SIM 卡'), findsOneWidget);
    expect(find.text('添加第一张 SIM 卡，记录号码、套餐和续费信息。'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('shows active SIM cards from the database', (tester) async {
    final now = DateTime.utc(2026, 5, 21);
    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'sim-1',
        carrierName: '中国移动',
        phoneNumber: '+886912345678',
        planName: const Value('畅享套餐'),
        monthlyFeeCents: const Value(9900),
        billingDay: const Value(10),
        createdAt: now,
        updatedAt: now,
      ),
    );

    await pumpApp(tester);

    expect(find.text('中国移动'), findsOneWidget);
    expect(find.text('+886 912 345 678'), findsOneWidget);
    expect(find.textContaining('畅享套餐'), findsOneWidget);
    expect(find.textContaining('¥99.00'), findsOneWidget);
    expect(find.textContaining('每月 10 日'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('opens the add SIM card form from the primary action', (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('新增 SIM 卡'), findsOneWidget);
    expect(find.byKey(const Key('carrierNameField')), findsOneWidget);

    await disposeApp(tester);
  });
}

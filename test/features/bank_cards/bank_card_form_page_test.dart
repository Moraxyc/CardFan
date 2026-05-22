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

  Future<void> pumpBankCardsPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const CardFanApp(),
      ),
    );
    await tester.pumpAndSettle();
    final navBar = find.byType(NavigationBar);
    await tester.tap(find.descendant(of: navBar, matching: find.text('银行卡')));
    await tester.pumpAndSettle();
  }

  Future<void> pumpRoute(WidgetTester tester) async {
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
  }

  Future<void> disposeApp(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  }

  Future<void> openAddForm(WidgetTester tester) async {
    await pumpBankCardsPage(tester);
    await tester.tap(find.byIcon(Icons.add));
    await pumpRoute(tester);
  }

  Future<void> tapSave(WidgetTester tester) async {
    tester.testTextInput.hide();
    await tester.pump();
    await tester.drag(find.byType(ListView).last, const Offset(0, -240));
    await tester.pump();
    await tester.tap(find.text('保存'));
  }

  testWidgets('shows empty bank card list and opens add form', (tester) async {
    await pumpBankCardsPage(tester);

    expect(find.text('还没有银行卡'), findsOneWidget);
    expect(find.text('添加第一张银行卡，记录账单日和还款日。'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await pumpRoute(tester);

    expect(find.text('新增银行卡'), findsOneWidget);
    expect(find.byKey(const Key('bankNameField')), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets(
    'can switch from SIM cards to bank cards without FAB hero conflict',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [databaseProvider.overrideWithValue(database)],
          child: const CardFanApp(),
        ),
      );

      await tester.tap(find.text('SIM'));
      await tester.pumpAndSettle();
      final navBar = find.byType(NavigationBar);
      await tester.tap(find.descendant(of: navBar, matching: find.text('银行卡')));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);

      await disposeApp(tester);
    },
  );

  testWidgets('shows active bank cards from the database', (tester) async {
    final now = DateTime.utc(2026, 5, 21);
    await database.bankCardsDao.create(
      BankCardsCompanion.insert(
        id: 'bank-1',
        bankName: '招商银行',
        cardName: const Value('经典白金卡'),
        lastFourDigits: '1234',
        statementDay: const Value(8),
        paymentDueDay: const Value(18),
        creditLimitCents: const Value(5000000),
        createdAt: now,
        updatedAt: now,
      ),
    );

    await pumpBankCardsPage(tester);

    expect(find.text('招商银行'), findsOneWidget);
    expect(find.textContaining('经典白金卡'), findsOneWidget);
    expect(find.textContaining('尾号 1234'), findsOneWidget);
    expect(find.textContaining('账单日 8 日'), findsOneWidget);
    expect(find.textContaining('还款日 18 日'), findsOneWidget);
    expect(find.textContaining('额度 ¥50000.00'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('validates bank card fields', (tester) async {
    await openAddForm(tester);

    await tester.enterText(
      find.byKey(const Key('lastFourDigitsField')),
      '12a4',
    );
    await tester.enterText(find.byKey(const Key('creditLimitField')), '-1');
    await tapSave(tester);
    await tester.pump();

    expect(find.text('请输入银行名称'), findsOneWidget);
    expect(find.text('请输入 4 位数字尾号'), findsOneWidget);
    expect(find.text('请输入有效额度'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('creates a bank card', (tester) async {
    await openAddForm(tester);

    await tester.enterText(find.byKey(const Key('bankNameField')), '招商银行');
    await tester.enterText(find.byKey(const Key('cardNameField')), '经典白金卡');
    await tester.enterText(
      find.byKey(const Key('lastFourDigitsField')),
      '1234',
    );
    await tester.enterText(find.byKey(const Key('creditLimitField')), '50000');
    tester.testTextInput.hide();
    await tester.pump();
    tester
        .widget<DropdownButtonFormField<int>>(
          find.byKey(const Key('statementDayField')),
        )
        .onChanged!(8);
    await tester.pump();
    tester
        .widget<DropdownButtonFormField<int>>(
          find.byKey(const Key('paymentDueDayField')),
        )
        .onChanged!(18);
    await tester.pump();
    await tester.enterText(find.byKey(const Key('notesField')), '主力卡');
    await tapSave(tester);
    await pumpRoute(tester);

    final cards = await database.bankCardsDao.getActive();
    expect(cards, hasLength(1));
    expect(cards.single.bankName, '招商银行');
    expect(cards.single.cardName, '经典白金卡');
    expect(cards.single.lastFourDigits, '1234');
    expect(cards.single.statementDay, 8);
    expect(cards.single.paymentDueDay, 18);
    expect(cards.single.creditLimitCents, 5000000);
    expect(cards.single.notes, '主力卡');

    await disposeApp(tester);
  });

  testWidgets('prefills and updates an existing bank card', (tester) async {
    final now = DateTime.utc(2026, 5, 21);
    await database.bankCardsDao.create(
      BankCardsCompanion.insert(
        id: 'bank-1',
        bankName: '招商银行',
        cardName: const Value('旧卡名'),
        lastFourDigits: '1234',
        creditLimitCents: const Value(5000000),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await pumpBankCardsPage(tester);

    await tester.tap(find.text('招商银行'));
    await pumpRoute(tester);

    expect(find.text('编辑银行卡'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, '招商银行'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, '旧卡名'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, '1234'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('bankNameField')), '中信银行');
    await tester.enterText(find.byKey(const Key('creditLimitField')), '88000');
    await tapSave(tester);
    await pumpRoute(tester);

    final updated = await database.bankCardsDao.getById('bank-1');
    expect(updated?.bankName, '中信银行');
    expect(updated?.creditLimitCents, 8800000);
    expect(updated?.syncStatus, 'pending');

    await disposeApp(tester);
  });

  testWidgets('soft deletes an existing bank card', (tester) async {
    final now = DateTime.utc(2026, 5, 21);
    await database.bankCardsDao.create(
      BankCardsCompanion.insert(
        id: 'bank-1',
        bankName: '招商银行',
        lastFourDigits: '1234',
        createdAt: now,
        updatedAt: now,
      ),
    );
    await pumpBankCardsPage(tester);

    await tester.tap(find.text('招商银行'));
    await pumpRoute(tester);
    await tester.tap(find.text('删除'));
    await pumpRoute(tester);
    await tester.tap(find.text('确认删除'));
    await pumpRoute(tester);

    expect(await database.bankCardsDao.getActive(), isEmpty);
    final deleted = await database.bankCardsDao.getById('bank-1');
    expect(deleted?.deletedAt, isNotNull);
    expect(deleted?.syncStatus, 'pending');

    await disposeApp(tester);
  });
}

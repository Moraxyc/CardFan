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

  Future<void> pumpSimCardsPage(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const CardFanApp(),
      ),
    );
    await tester.tap(find.text('SIM'));
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
    await pumpSimCardsPage(tester);
    await tester.tap(find.byIcon(Icons.add));
    await pumpRoute(tester);
  }

  testWidgets('validates required carrier and phone fields', (tester) async {
    await openAddForm(tester);

    await tester.tap(find.text('保存'));
    await tester.pump();

    expect(find.text('请输入运营商'), findsOneWidget);
    expect(find.text('请输入手机号'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('validates phone and monthly fee formats', (tester) async {
    await openAddForm(tester);

    await tester.enterText(find.byKey(const Key('carrierNameField')), '中国联通');
    await tester.enterText(
      find.byKey(const Key('phoneNumberField')),
      '15600000000',
    );
    await tester.enterText(find.byKey(const Key('monthlyFeeField')), '12.345');
    await tester.tap(find.text('保存'));
    await tester.pump();

    expect(find.text('请输入国际格式手机号，例如 +886912345678'), findsOneWidget);
    expect(find.text('月费最多支持 2 位小数'), findsOneWidget);

    await disposeApp(tester);
  });

  testWidgets('creates a SIM card', (tester) async {
    await openAddForm(tester);

    await tester.enterText(find.byKey(const Key('carrierNameField')), '中国联通');
    await tester.enterText(
      find.byKey(const Key('phoneNumberField')),
      '+33 6 86.57.90.14',
    );
    await tester.enterText(find.byKey(const Key('planNameField')), '冰激凌套餐');
    await tester.enterText(find.byKey(const Key('monthlyFeeField')), '59.9');
    tester.testTextInput.hide();
    await tester.pump();
    final billingDayField = tester.widget<DropdownButtonFormField<int>>(
      find.byKey(const Key('billingDayField')),
    );
    billingDayField.onChanged!(18);
    await tester.pump();
    await tester.enterText(find.byKey(const Key('notesField')), '备用号码');
    await tester.tap(find.text('保存'));
    await pumpRoute(tester);

    final simCards = await database.simCardsDao.getActive();
    expect(simCards, hasLength(1));
    expect(simCards.single.carrierName, '中国联通');
    expect(simCards.single.phoneNumber, '+33686579014');
    expect(simCards.single.planName, '冰激凌套餐');
    expect(simCards.single.monthlyFeeCents, 5990);
    expect(simCards.single.billingDay, 18);
    expect(simCards.single.notes, '备用号码');

    await disposeApp(tester);
  });

  testWidgets('prefills and updates an existing SIM card', (tester) async {
    final now = DateTime.utc(2026, 5, 21);
    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'sim-1',
        carrierName: '中国移动',
        phoneNumber: '+8613800138000',
        planName: const Value('旧套餐'),
        monthlyFeeCents: const Value(9900),
        billingDay: const Value(10),
        createdAt: now,
        updatedAt: now,
      ),
    );
    await pumpSimCardsPage(tester);

    await tester.tap(find.text('中国移动'));
    await pumpRoute(tester);

    expect(find.text('编辑 SIM 卡'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, '中国移动'), findsOneWidget);
    expect(
      find.widgetWithText(TextFormField, '+8613800138000'),
      findsOneWidget,
    );
    expect(find.widgetWithText(TextFormField, '99.00'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('carrierNameField')), '中国电信');
    await tester.enterText(find.byKey(const Key('monthlyFeeField')), '129');
    await tester.tap(find.text('保存'));
    await pumpRoute(tester);

    final updated = await database.simCardsDao.getById('sim-1');
    expect(updated?.carrierName, '中国电信');
    expect(updated?.monthlyFeeCents, 12900);
    expect(updated?.syncStatus, 'pending');

    await disposeApp(tester);
  });

  testWidgets('soft deletes an existing SIM card', (tester) async {
    final now = DateTime.utc(2026, 5, 21);
    await database.simCardsDao.create(
      SimCardsCompanion.insert(
        id: 'sim-1',
        carrierName: '中国移动',
        phoneNumber: '13800138000',
        createdAt: now,
        updatedAt: now,
      ),
    );
    await pumpSimCardsPage(tester);

    await tester.tap(find.text('中国移动'));
    await pumpRoute(tester);
    await tester.tap(find.text('删除'));
    await pumpRoute(tester);
    await tester.tap(find.text('确认删除'));
    await pumpRoute(tester);

    expect(await database.simCardsDao.getActive(), isEmpty);
    final deleted = await database.simCardsDao.getById('sim-1');
    expect(deleted?.deletedAt, isNotNull);
    expect(deleted?.syncStatus, 'pending');

    await disposeApp(tester);
  });
}

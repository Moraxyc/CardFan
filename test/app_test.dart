import 'package:cardfan/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('app renders', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CardFanApp(),
      ),
    );

    expect(find.byType(CardFanApp), findsOneWidget);
  });
}

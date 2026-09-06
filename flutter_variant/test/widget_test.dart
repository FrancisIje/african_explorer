// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_variant/main.dart';

void main() {
  testWidgets('Onboarding routes to Discover', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Starts on onboarding.
    expect(find.text('Get started'), findsOneWidget);
    expect(find.text('Discover'), findsNothing);

    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    // Lands on the Discover tab.
    expect(find.text('Discover'), findsWidgets);
  });
}

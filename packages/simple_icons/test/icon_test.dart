import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_icons/simple_icons.dart';

void main() {
  const icon = SimpleIcons.simpleicons;
  group('Simple Icons Tests', () {
    testWidgets('Widget test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Icon(icon)));

      final iconFinder = find.byIcon(icon);
      expect(iconFinder, findsOneWidget);

      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(iconWidget.icon, isNotNull);
      expect(iconWidget.icon!.fontFamily, 'SimpleIcons');
    });

    testWidgets('Golden test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Icon(icon)));

      await expectLater(
        find.byIcon(icon),
        matchesGoldenFile('goldens/icon.png'),
      );
    });
  });
}

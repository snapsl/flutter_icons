import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hero_icons/hero_icons.dart';
import 'package:hero_icons/src/icon_data.g.dart';
import 'package:test_utils/test_utils.dart';

void main() async {
  const icon = HeroIcons.heart_outline;
  const icon2 = HeroIcons.heart;

  setUpAll(() async {
    await loadFonts({'fonts/outline.ttf': icon, 'fonts/solid.ttf': icon2});
  });

  group('Hero Icons Tests', () {
    for (final icon in [icon, icon2]) {
      testWidgets('Widget test ${icon.fontFamily}', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(MaterialApp(home: Icon(icon)));

        final iconFinder = find.byIcon(icon);
        expect(iconFinder, findsOneWidget);

        final iconWidget = tester.widget<Icon>(iconFinder);

        expect(iconWidget.icon, isNotNull);
        expect(iconWidget.icon!.fontFamily, icon.fontFamily);
      });
    }
  });

  group('Golden test', () {
    for (final icon in [icon, icon2]) {
      testWidgets('Golden test ${icon.fontFamily}', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Icon(
              IconData(
                icon.codePoint,
                fontFamily: icon.fontFamily,
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Icon),
          matchesGoldenFile('goldens/${icon.fontFamily}.png'),
        );
      });
    }
  });
}

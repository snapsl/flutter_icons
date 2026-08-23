import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hero_icons/hero_icons.dart';
import 'package:test_utils/test_utils.dart';

void main() async {
  const iconMap = {
    'fonts/mini.ttf': HeroIcons.heart_mini,
    'fonts/micro.ttf': HeroIcons.heart_micro,
    'fonts/outline.ttf': HeroIcons.heart_outline,
    'fonts/solid.ttf': HeroIcons.heart,
  };

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await loadFonts(
      iconMap: iconMap,
      packageName: 'hero_icons',
    );

    goldenFileComparator = TolerantGoldenFileComparator(
      precisionTolerance: 0.01,
    );
  });

  group('Golden tests', () {
    for (final icon in iconMap.values) {
      testWidgets('Widget test ${icon.fontFamily}', (tester) async {
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
    for (final icon in iconMap.values) {
      testWidgets('Golden test ${icon.fontFamily}', (tester) async {
        await tester.pumpWidget(MaterialApp(home: TestIcon(icon)));

        await expectLater(
          find.byType(Icon),
          matchesGoldenFile('goldens/${icon.fontFamily}.png'),
        );
      });
    }
  });
}

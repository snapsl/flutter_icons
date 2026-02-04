import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:radix_icons/radix_icons.dart';

import 'package:test_utils/test_utils.dart';

void main() {
  const icon = RadixIcons.starFilled;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await loadFonts(
      iconMap: {'fonts/radix.ttf': icon},
      packageName: 'radix_icons',
    );

    goldenFileComparator = TolerantGoldenFileComparator(
      precisionTolerance: 0.01,
    );
  });

  group('Radix Icons Tests', () {
    testWidgets('Widget test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Icon(icon)));

      final iconFinder = find.byIcon(icon);
      expect(iconFinder, findsOneWidget);

      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(iconWidget.icon, isNotNull);
      expect(iconWidget.icon!.fontFamily, 'RadixIcons');
    });

    testWidgets('Golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Icon(
            size: 240,
            IconData(icon.codePoint, fontFamily: icon.fontFamily),
          ),
        ),
      );

      await expectLater(
        find.byType(Icon),
        matchesGoldenFile('goldens/icon.png'),
      );
    });
  });
}

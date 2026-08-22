import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:primer_icons/primer_icons.dart';

import 'package:test_utils/test_utils.dart';

void main() {
  const icon = OctIcons.alert16;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await loadFonts(
      iconMap: {'fonts/octicons.ttf': icon},
      packageName: 'primer_icons',
    );

    goldenFileComparator = TolerantGoldenFileComparator(
      precisionTolerance: 0.01,
    );
  });

  group('Primer Icons Tests', () {
    testWidgets('Widget test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Icon(icon)));

      final iconFinder = find.byIcon(icon);
      expect(iconFinder, findsOneWidget);

      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(iconWidget.icon, isNotNull);
      expect(iconWidget.icon!.fontFamily, 'OctIcons');
    });

    testWidgets('Golden test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: TestIcon(icon)));

      await expectLater(
        find.byType(Icon),
        matchesGoldenFile('goldens/icon.png'),
      );
    });
  });
}

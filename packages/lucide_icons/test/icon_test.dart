import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:test_utils/test_utils.dart';

void main() {
  const icon = LucideIcons.airplay;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await loadFonts(
      iconMap: {'fonts/lucide.ttf': icon},
      packageName: 'lucide_icons',
    );

    final testUrl = (goldenFileComparator as LocalFileComparator).basedir;
    goldenFileComparator = LocalFileComparatorWithThreshold(testUrl, 0.05);
  });

  group('Lucide Icons Tests', () {
    testWidgets('Widget test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Icon(icon)));

      final iconFinder = find.byIcon(icon);
      expect(iconFinder, findsOneWidget);

      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(iconWidget.icon, isNotNull);
      expect(iconWidget.icon!.fontFamily, 'LucideIcons');
    });

    testWidgets('Golden test', (WidgetTester tester) async {
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

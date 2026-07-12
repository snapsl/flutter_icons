import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ionic_icons/ionic_icons.dart';
import 'package:test_utils/test_utils.dart';

void main() {
  const icon = IonicIcons.alarm;

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await loadFonts(
      iconMap: {'fonts/ionicons.ttf': icon},
      packageName: 'ionic_icons',
    );

    goldenFileComparator = TolerantGoldenFileComparator(
      precisionTolerance: 0.01,
    );
  });

  group('Ionic Icons Tests', () {
    testWidgets('Widget test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Icon(icon)));

      final iconFinder = find.byIcon(icon);
      expect(iconFinder, findsOneWidget);

      final iconWidget = tester.widget<Icon>(iconFinder);

      expect(iconWidget.icon, isNotNull);
      expect(iconWidget.icon!.fontFamily, 'IonicIcons');
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

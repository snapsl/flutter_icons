import 'package:ant_design_icons/ant_design_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_utils/test_utils.dart';

void main() async {
  const icons = [
    AntDesignIcons.antDesign_outlined,
    AntDesignIcons.fileText_filled,
  ];

  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await loadFonts(
      iconMap: {
        'fonts/antoutline.ttf': icons[0],
        'fonts/antfill.ttf': icons[1],
      },
      packageName: 'ant_design_icons',
    );

    goldenFileComparator = TolerantGoldenFileComparator(
      precisionTolerance: 0.01,
    );
  });

  group('Widget tests', () {
    for (final icon in icons) {
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

  group('Golden tests', () {
    for (final icon in icons) {
      testWidgets('Golden test ${icon.fontFamily}', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Icon(
              size: 240,
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

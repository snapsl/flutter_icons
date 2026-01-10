import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart';
import 'package:simple_icons/simple_icons.dart';

void main() {
  testWidgets('Example Test', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Flutter Icons Example'), findsOneWidget);
    expect(find.byIcon(SimpleIcons.simpleicons), findsOneWidget);
  });
}

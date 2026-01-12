import 'package:ant_design_icons/ant_design_icons.dart';
import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Example Test', (tester) async {
    await tester.pumpWidget(const ExampleApp());

    expect(find.text('Flutter Icons Example'), findsOneWidget);
    expect(find.byIcon(AntDesignIcons.antDesign_outlined), findsOneWidget);
  });
}

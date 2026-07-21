import 'package:flutter_test/flutter_test.dart';
import 'package:generator/generator.dart';

void main() {
  late IconFileGenerator generator;

  setUpAll(() {
    generator = IconFileGenerator();
  });

  group('parseName tests', () {
    test('converts snake_case/kebab-case to camelCase', () {
      expect(generator.parseName('arrow_up'), 'arrowUp');
      expect(generator.parseName('arrow-down'), 'arrowDown');
      expect(generator.parseName('arrow up'), 'arrowUp');
    });

    test('resolves known symbol names', () {
      expect(generator.parseName('*'), 'multiplySymbol');
      expect(generator.parseName('+'), 'plusSymbol');
      expect(generator.parseName('@'), 'atSymbol');
    });

    test('appends Icon suffix to Dart keywords', () {
      expect(generator.parseName('class'), 'classIcon');
      expect(generator.parseName('switch'), 'switchIcon');
      expect(generator.parseName('void'), 'voidIcon');
    });

    test('prepends n to variables starting with a digit', () {
      expect(generator.parseName('500px'), 'n500px');
      expect(generator.parseName('1-password'), 'n1Password');
    });
  });
}

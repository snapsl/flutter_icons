import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Golden file comparator with tolerance for minor differences.
class TolerantGoldenFileComparator extends LocalFileComparator {
  /// Creates a [TolerantGoldenFileComparator].
  factory TolerantGoldenFileComparator({
    required double precisionTolerance,
    Uri? testFile,
  }) {
    final baseUri =
        testFile ?? (goldenFileComparator as LocalFileComparator).basedir;

    final resolvedUri = baseUri.path.endsWith('.dart')
        ? baseUri
        : baseUri.resolve('dummy.dart');

    return TolerantGoldenFileComparator._(resolvedUri, precisionTolerance);
  }

  TolerantGoldenFileComparator._(super.testFile, this.precisionTolerance)
    : assert(
        0 <= precisionTolerance && precisionTolerance <= 1,
        'precisionTolerance must be between 0 and 1',
      ) {
    goldenFileComparator = this;
  }

  /// How much the golden image can differ from the test image.
  ///
  /// It is expected to be between 0 and 1.
  /// Where 0 is no difference (the same image)
  /// and 1 is the maximum difference (completely different images).
  final double precisionTolerance;

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (!result.passed && result.diffPercent <= precisionTolerance) {
      stdout.write(
        '''
Soft Match: ${result.diffPercent * 100}% diff (within ${precisionTolerance * 100} % limit)
''',
      );
    }

    final passed = result.passed || result.diffPercent <= precisionTolerance;

    if (passed) {
      result.dispose();
      return true;
    }

    final error = await generateFailureOutput(result, golden, basedir);
    result.dispose();
    throw FlutterError(error);
  }
}

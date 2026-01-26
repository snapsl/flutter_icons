import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The custom comparator class (Keep this outside main)
class LocalFileComparatorWithThreshold extends LocalFileComparator {
  /// Constructor
  LocalFileComparatorWithThreshold(super.testFile, this.threshold);

  /// Golden test threshold
  final double threshold;

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );

    if (!result.passed && result.diffPercent <= threshold) {
      stdout.write(
        '''
Soft Match: ${result.diffPercent * 100}% diff (within ${threshold * 100} % limit)
''',
      );
      return true;
    }

    if (!result.passed) {
      final error = await generateFailureOutput(result, golden, basedir);
      throw FlutterError(error);
    }

    return result.passed;
  }
}

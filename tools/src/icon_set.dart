import 'font_config.dart';

class IconSet {
  IconSet({
    required this.id,
    required this.packagePath,
    required this.vendorPath,
    required this.packageName,
    required this.className,
    required this.url,
    required this.brand,
    required this.fonts,
    required this.outputPath,
  });

  factory IconSet.fromJson(Map<String, dynamic> json) {
    return IconSet(
      id: json['id'] as String,
      packagePath: json['package_path'] as String,
      vendorPath: json['vendor_path'] as String,
      packageName: json['package_name'] as String,
      className: json['class_name'] as String,
      url: json['url'] as String,
      brand: json['brand'] as String,
      outputPath: json['output_path'] as String,
      fonts: (json['fonts'] as List<dynamic>)
          .map((e) => FontConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final String id;
  final String packagePath;
  final String vendorPath;
  final String packageName;
  final String className;
  final String url;
  final String brand;
  final List<FontConfig> fonts;
  final String outputPath;
}

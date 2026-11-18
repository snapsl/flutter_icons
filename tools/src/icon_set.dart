import 'font_config.dart';

class const IconSet({
  required final String id,
  required final String packagePath,
  required final String vendorPath,
  required final String packageName,
  required final String className,
  required final String url,
  required final String brand,
  required final List<FontConfig> fonts,
  required final String outputPath,
}) {
  factory fromJson(Map<String, dynamic> json) {
    return .new(
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
}

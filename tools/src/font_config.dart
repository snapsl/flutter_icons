class FontConfig {
  FontConfig({
    required this.file,
    required this.svgPath,
    required this.fontPath,
    required this.dataClassName,
    required this.suffix,
  });

  factory FontConfig.fromJson(Map<String, dynamic> json) {
    return FontConfig(
      file: json['file'] as String,
      svgPath: json['svg_path'] as String,
      fontPath: json['font_path'] as String,
      dataClassName: json['data_class_name'] as String,
      suffix: json['suffix'] as String? ?? '',
    );
  }

  final String file;
  final String svgPath;
  final String fontPath;
  final String dataClassName;
  final String suffix;
}

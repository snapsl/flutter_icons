class FontConfig {
  FontConfig({
    required this.file,
    required this.svgPath,
    required this.fontPath,
    required this.fontFamily,
    required this.suffix,
  });

  factory FontConfig.fromJson(Map<String, dynamic> json) {
    return FontConfig(
      file: json['file'] as String,
      svgPath: json['svg_path'] as String,
      fontPath: json['font_path'] as String,
      fontFamily: json['font_family'] as String,
      suffix: json['suffix'] as String? ?? '',
    );
  }

  final String file;
  final String svgPath;
  final String fontPath;
  final String fontFamily;
  final String suffix;
}

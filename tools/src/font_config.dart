class const FontConfig({
  required final String file,
  required final String svgPath,
  required final String fontPath,
  required final String fontFamily,
  required final String suffix,
}) {
  factory fromJson(Map<String, dynamic> json) {
    return .new(
      file: json['file'] as String,
      svgPath: json['svg_path'] as String,
      fontPath: json['font_path'] as String,
      fontFamily: json['font_family'] as String,
      suffix: json['suffix'] as String? ?? '',
    );
  }
}

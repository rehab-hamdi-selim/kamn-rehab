class DocumentItem {
  final String title;
  final String translation;
  final double? fontSize;
  final bool? isValid;

  const DocumentItem({
    required this.title,
    required this.translation,
    this.fontSize,
    this.isValid,
  });
}
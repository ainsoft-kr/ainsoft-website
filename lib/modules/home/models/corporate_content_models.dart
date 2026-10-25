class CorporateInfoCardData {
  const CorporateInfoCardData({
    required this.title,
    required this.body,
    this.accentLabel,
    this.dark = false,
  });

  final String title;
  final String body;
  final String? accentLabel;
  final bool dark;
}

class CorporateMetricData {
  const CorporateMetricData({
    required this.value,
    required this.label,
    this.dark = false,
  });

  final String value;
  final String label;
  final bool dark;
}

class SiteCardData {
  const SiteCardData({
    required this.title,
    required this.body,
    this.kind,
    this.items = const [],
    this.note,
    this.linkLabel,
  });

  final String title;
  final String body;
  final String? kind;
  final List<(String, String)> items;
  final String? note;
  final String? linkLabel;
}

class SiteScenarioData {
  const SiteScenarioData({
    required this.who,
    required this.title,
    required this.before,
    required this.after,
    this.kind,
  });

  final String who;
  final String title;
  final String before;
  final String after;
  final String? kind;
}

class SiteSpecData {
  const SiteSpecData(this.term, this.value);

  final String term;
  final String value;
}

class SiteRepoData {
  const SiteRepoData({required this.name, required this.url, this.note});

  final String name;
  final String url;
  final String? note;
}

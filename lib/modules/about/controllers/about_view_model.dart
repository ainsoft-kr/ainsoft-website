import '/modules/about/data/about_content.dart';
import '/modules/home/models/corporate_content_models.dart';

class AboutViewModel {
  String get founderName => AboutContent.founderName;

  String get founderRole => AboutContent.founderRole;

  String get founderLocation => AboutContent.founderLocation;

  String get founderEducation => AboutContent.founderEducation;

  List<String> get founderIntroParagraphs =>
      AboutContent.founderIntroParagraphs;

  List<String> get founderFocusTags => AboutContent.founderFocusTags;

  List<CorporateInfoCardData> get founderHighlightCards =>
      AboutContent.founderHighlightCards;

  List<CorporateInfoCardData> get overviewCards => AboutContent.overviewCards;

  List<CorporateInfoCardData> get strengthCards => AboutContent.strengthCards;

  List<CorporateMetricData> get snapshotMetrics => AboutContent.snapshotMetrics;
}

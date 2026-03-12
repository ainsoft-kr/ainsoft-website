import '/modules/about/data/about_content.dart';
import '/modules/home/models/corporate_content_models.dart';

class AboutViewModel {
  List<CorporateInfoCardData> get overviewCards => AboutContent.overviewCards;

  List<CorporateInfoCardData> get strengthCards => AboutContent.strengthCards;

  List<CorporateMetricData> get snapshotMetrics => AboutContent.snapshotMetrics;
}

import '/modules/home/models/corporate_content_models.dart';
import '/modules/services/data/services_content.dart';

class ServicesViewModel {
  List<CorporateInfoCardData> get overviewCards =>
      ServicesContent.overviewCards;

  List<CorporateInfoCardData> get internvlCards =>
      ServicesContent.internvlCards;

  List<CorporateInfoCardData> get llmServiceCards =>
      ServicesContent.llmServiceCards;

  List<CorporateInfoCardData> get readyServiceCards =>
      ServicesContent.readyServiceCards;

  List<CorporateInfoCardData> get extendedServiceCards =>
      ServicesContent.extendedServiceCards;

  List<CorporateInfoCardData> get llmStackCards => ServicesContent.llmStackCards;

  List<CorporateMetricData> get internvlMetrics =>
      ServicesContent.internvlMetrics;

  List<CorporateMetricData> get llmMetrics => ServicesContent.llmMetrics;
}

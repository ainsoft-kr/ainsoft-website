import '/modules/contact/data/contact_content.dart';
import '/modules/home/models/corporate_content_models.dart';

class ContactViewModel {
  List<CorporateInfoCardData> get contactCards => ContactContent.contactCards;

  List<CorporateInfoCardData> get channelCards => ContactContent.channelCards;

  List<CorporateMetricData> get checklistMetrics =>
      ContactContent.checklistMetrics;
}

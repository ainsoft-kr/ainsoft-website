import '/modules/contact/data/contact_content.dart';
import '/modules/contact/data/models/contact_inquiry.dart';
import '/modules/contact/data/services/contact_service.dart';
import '/modules/home/models/corporate_content_models.dart';

class ContactViewModel {
  ContactViewModel({ContactService? service})
    : _service = service ?? ContactService();

  final ContactService _service;

  List<CorporateInfoCardData> get contactCards => ContactContent.contactCards;

  List<CorporateInfoCardData> get channelCards => ContactContent.channelCards;

  List<CorporateMetricData> get checklistMetrics =>
      ContactContent.checklistMetrics;

  List<String> get inquiryTypes => ContactContent.inquiryTypes;

  String get privacyNotice => ContactContent.privacyNotice;

  Future<void> submitInquiry(ContactInquiry inquiry) =>
      _service.submit(inquiry);
}

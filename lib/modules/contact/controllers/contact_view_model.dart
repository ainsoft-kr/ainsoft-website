import '/modules/contact/data/contact_content.dart';

class ContactViewModel {
  String get email => ContactContent.email;

  String get phone => ContactContent.phone;

  String get replyPromise => ContactContent.replyPromise;

  List<(String, String)> get checklist => ContactContent.checklist;

  List<(String, String)> get topics => ContactContent.topics;

  String get mailtoUrl => Uri(
    scheme: 'mailto',
    path: ContactContent.email,
    query: _encodeQuery({
      'subject': ContactContent.mailSubject,
      'body': ContactContent.mailBody,
    }),
  ).toString();

  String get telUrl => 'tel:${ContactContent.phone.replaceAll(' ', '')}';

  // mailto needs %20 rather than '+' for spaces, so encode by hand.
  static String _encodeQuery(Map<String, String> params) => params.entries
      .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

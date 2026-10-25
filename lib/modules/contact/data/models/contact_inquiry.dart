class ContactInquiry {
  const ContactInquiry({
    required this.name,
    required this.email,
    required this.type,
    required this.message,
    required this.privacyConsent,
    this.company = '',
    this.phone = '',
    this.website = '',
  });

  final String name;
  final String company;
  final String email;
  final String phone;
  final String type;
  final String message;
  final bool privacyConsent;

  /// 봇 차단용 허니팟 필드. 화면에 보이지 않으므로 사람은 비워 둔다.
  final String website;

  Map<String, dynamic> toJson() => {
    'name': name.trim(),
    'company': company.trim(),
    'email': email.trim(),
    'phone': phone.trim(),
    'type': type,
    'message': message.trim(),
    'privacyConsent': privacyConsent,
    'website': website,
  };
}

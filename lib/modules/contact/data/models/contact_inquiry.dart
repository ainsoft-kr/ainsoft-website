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

  /// 메일 발송 API(mail-sender) 요청 본문
  Map<String, dynamic> toJson() {
    final trimmedName = name.trim();
    final trimmedCompany = company.trim();

    return {
      'subject':
          '$type - $trimmedName${trimmedCompany.isEmpty ? '' : ' ($trimmedCompany)'}',
      'message': message.trim(),
      'name': trimmedName,
      'email': email.trim(),
      'fields': {
        '문의 유형': type,
        '회사': trimmedCompany,
        '연락처': phone.trim(),
        '개인정보 수집·이용 동의': privacyConsent ? '동의' : '미동의',
      },
      'website': website,
    };
  }
}

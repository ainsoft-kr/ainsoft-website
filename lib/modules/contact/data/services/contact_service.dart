import 'dart:convert';

import 'package:http/http.dart' as http;

import '/core/config/api_config.dart';
import '/modules/contact/data/models/contact_inquiry.dart';

class ContactSubmitException implements Exception {
  const ContactSubmitException(this.code);

  /// 서버 오류 코드 (예: `email_invalid`) 또는 `network_error`.
  final String code;

  @override
  String toString() => 'ContactSubmitException($code)';
}

class ContactService {
  ContactService({
    http.Client? client,
    this.endpoint = APIConfiguration.mailSenderUrl,
  }) : _client = client ?? http.Client();

  final http.Client _client;
  final String endpoint;

  Future<void> submit(ContactInquiry inquiry) async {
    final http.Response response;
    try {
      response = await _client
          .post(
            Uri.parse(endpoint),
            headers: const {'Content-Type': 'application/json'},
            body: jsonEncode(inquiry.toJson()),
          )
          .timeout(const Duration(seconds: 15));
    } catch (_) {
      throw const ContactSubmitException('network_error');
    }

    if (response.statusCode == 200) return;

    throw ContactSubmitException(_errorCode(response.body));
  }

  String _errorCode(String body) {
    try {
      final decoded = jsonDecode(body);
      if (decoded is Map && decoded['error'] is String) {
        return decoded['error'] as String;
      }
    } catch (_) {}
    return 'server_error';
  }
}

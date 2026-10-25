import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ainsoft_website/modules/contact/data/models/contact_inquiry.dart';
import 'package:ainsoft_website/modules/contact/data/services/contact_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  const inquiry = ContactInquiry(
    name: ' 홍길동 ',
    company: '에이아이엔',
    email: 'hong@example.com',
    type: '도입 상담',
    message: '도입 상담을 요청합니다.',
    privacyConsent: true,
  );

  group('ContactService', () {
    test('입력값을 JSON으로 POST 전송', () async {
      late http.Request sent;
      final service = ContactService(
        endpoint: 'https://example.test/contact',
        client: MockClient((request) async {
          sent = request;
          return http.Response('{"ok":true}', 200);
        }),
      );

      await service.submit(inquiry);

      expect(sent.method, 'POST');
      expect(sent.url.toString(), 'https://example.test/contact');
      expect(sent.headers['Content-Type'], startsWith('application/json'));
      final body = jsonDecode(sent.body) as Map<String, dynamic>;
      expect(body['subject'], '도입 상담 - 홍길동 (에이아이엔)');
      expect(body['name'], '홍길동');
      expect(body['email'], 'hong@example.com');
      expect(body['fields'], {
        '문의 유형': '도입 상담',
        '회사': '에이아이엔',
        '연락처': '',
        '개인정보 수집·이용 동의': '동의',
      });
      expect(body['website'], '');
    });

    test('서버 오류 코드를 예외로 전달', () async {
      final service = ContactService(
        client: MockClient(
          (_) async => http.Response('{"error":"email_invalid"}', 400),
        ),
      );

      expect(
        () => service.submit(inquiry),
        throwsA(
          isA<ContactSubmitException>().having(
            (e) => e.code,
            'code',
            'email_invalid',
          ),
        ),
      );
    });

    test('네트워크 실패는 network_error', () async {
      final service = ContactService(
        client: MockClient((_) async => throw http.ClientException('offline')),
      );

      expect(
        () => service.submit(inquiry),
        throwsA(
          isA<ContactSubmitException>().having(
            (e) => e.code,
            'code',
            'network_error',
          ),
        ),
      );
    });
  });
}

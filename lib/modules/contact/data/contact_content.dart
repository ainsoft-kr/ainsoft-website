import '/modules/home/models/corporate_content_models.dart';

class ContactContent {
  ContactContent._();

  static const List<CorporateInfoCardData> contactCards = [
    CorporateInfoCardData(
      title: '도입 상담',
      body:
          'AISOpsFlow, Ainsoft RAG, 또는 두 제품의 조합이 현재 운영 환경에 어떻게 맞을지 함께 검토합니다. 도입 목적과 우선순위만 있어도 상담을 시작할 수 있습니다.',
      accentLabel: 'Consulting',
    ),
    CorporateInfoCardData(
      title: 'PoC / Demo',
      body:
          '제품 구조와 적용 시나리오를 직접 확인할 수 있도록 데모와 PoC 방향을 함께 제안합니다. 운영 자동화와 지식검색의 연결 방식을 실제 흐름 기준으로 설명합니다.',
      accentLabel: 'Proof of Value',
    ),
    CorporateInfoCardData(
      title: 'Partnership',
      body:
          '플러그인 확장, 시스템 통합, 온프레미스 배치처럼 협업이 필요한 주제도 함께 논의할 수 있습니다. 제품 소개를 넘어 실제 적용 구조까지 연결합니다.',
      accentLabel: 'Collaboration',
    ),
  ];

  static const List<CorporateInfoCardData> channelCards = [
    CorporateInfoCardData(
      title: '운영 자동화가 필요한 경우',
      body:
          '알림 이후 승인, 실행, 보고 흐름을 어떻게 표준화할지, 보안 경계를 어떻게 유지할지, 어떤 채널과 도구를 연결할지 중심으로 상담합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '지식검색이 필요한 경우',
      body:
          '운영 매뉴얼, 정책 문서, 장애 이력을 어떤 구조로 검색 가능하게 만들지, 기존 서비스 안에 어떻게 통합할지 중심으로 상담합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '통합 시나리오가 필요한 경우',
      body:
          'AISOpsFlow와 Ainsoft RAG를 함께 사용해 운영 코파일럿, 서비스데스크 자동화, 온프레미스 운영 시나리오를 어떻게 설계할지 논의합니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> checklistMetrics = [
    CorporateMetricData(value: 'Use Case', label: '적용하려는 업무 흐름'),
    CorporateMetricData(value: 'Environment', label: '현재 운영 환경'),
    CorporateMetricData(value: 'Timeline', label: '희망 일정'),
  ];

  /// 문의 유형 (서버의 INQUIRY_TYPES와 동일해야 함)
  static const List<String> inquiryTypes = [
    '도입 상담',
    'PoC / Demo',
    'Partnership',
    '기타',
  ];

  static const String privacyNotice =
      '수집 항목: 이름, 회사명, 이메일, 연락처, 문의 내용 · 이용 목적: 문의 확인 및 답변 · 보유 기간: 문의 처리 완료 후 1년';
}

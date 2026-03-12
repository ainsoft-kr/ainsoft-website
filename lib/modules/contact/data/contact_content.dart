import '/modules/home/models/corporate_content_models.dart';

class ContactContent {
  ContactContent._();

  static const List<CorporateInfoCardData> contactCards = [
    CorporateInfoCardData(
      title: '대표 메일',
      body: 'contact@ainsoft.example 형태로 문의 채널을 가장 먼저 노출합니다.',
      accentLabel: 'Email',
    ),
    CorporateInfoCardData(
      title: '상담 프로세스',
      body: '문의 접수 후 요구사항 확인, 솔루션 제안, 일정 협의의 흐름을 짧게 안내합니다.',
      accentLabel: 'Process',
    ),
    CorporateInfoCardData(
      title: '응답 기준',
      body: '영업일 기준 응답 시간이나 상담 가능 시간대를 함께 적어 기대치를 맞춥니다.',
      accentLabel: 'Response',
    ),
  ];

  static const List<CorporateInfoCardData> channelCards = [
    CorporateInfoCardData(
      title: '전화 상담',
      body: '긴급한 제품 문의나 도입 일정 협의가 필요한 경우 빠른 연결 포인트를 제공합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '이메일 문의',
      body: '요구사항 정리나 제안 요청처럼 문서 기반 커뮤니케이션이 필요한 경우 적합합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '데모 요청',
      body: '제품 소개, 적용 시나리오, 예상 일정까지 한 번에 논의할 수 있는 진입점입니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> checklistMetrics = [
    CorporateMetricData(value: '1', label: '산업군'),
    CorporateMetricData(value: '2', label: '필요 기능'),
    CorporateMetricData(value: '3', label: '예상 일정'),
  ];
}

import '/modules/home/models/corporate_content_models.dart';

class AboutContent {
  AboutContent._();

  static const List<CorporateInfoCardData> overviewCards = [
    CorporateInfoCardData(
      title: 'Mission',
      body: '복잡한 기업용 서비스를 더 명확한 정보 구조와 더 빠른 사용자 흐름으로 바꾸는 것이 목표입니다.',
      accentLabel: 'Direction',
    ),
    CorporateInfoCardData(
      title: 'Execution',
      body: '기획, 개발, 운영이 끊기지 않도록 제품 이해와 프로젝트 대응 체계를 함께 설계합니다.',
      accentLabel: 'Capability',
    ),
    CorporateInfoCardData(
      title: 'Trust',
      body: '도입 맥락, 구축 경험, 대응 속도를 하나의 메시지로 정리해 고객이 빠르게 신뢰할 수 있게 만듭니다.',
      accentLabel: 'Confidence',
    ),
  ];

  static const List<CorporateInfoCardData> strengthCards = [
    CorporateInfoCardData(
      title: '도메인 이해',
      body: 'B2B 서비스 도입 흐름과 실제 의사결정 포인트를 기준으로 콘텐츠를 설계합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '구축 경험',
      body: '회사 홈페이지, 제품 소개, 운영성 강조, 리드 수집 구조까지 목적에 맞는 화면 구조를 만듭니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '운영 용이성',
      body: '섹션 단위 분리와 명확한 라우팅 구조로 유지보수와 확장 비용을 낮춥니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> snapshotMetrics = [
    CorporateMetricData(value: '3', label: '핵심 신뢰 포인트'),
    CorporateMetricData(value: '4', label: '분리된 회사 페이지 섹션'),
    CorporateMetricData(value: '1', label: '일관된 문의 흐름'),
  ];
}

import '/modules/home/models/corporate_content_models.dart';

class AboutContent {
  AboutContent._();

  static const List<CorporateInfoCardData> overviewCards = [
    CorporateInfoCardData(
      title: 'Mission',
      body:
          'AINSOFT는 운영 자동화와 지식검색을 실제 현장에서 바로 쓸 수 있는 제품으로 만듭니다. 복잡한 운영 환경에서도 더 빠른 판단과 더 안전한 실행이 가능하도록 설계합니다.',
      accentLabel: 'Why We Build',
    ),
    CorporateInfoCardData(
      title: 'Products',
      body:
          'AISOpsFlow는 운영 이벤트를 실행 가능한 워크플로우로 바꾸고, Ainsoft RAG는 문서와 정책을 검색 가능한 지식 레이어로 바꿉니다. 두 제품은 역할이 분명하고 함께 쓸 때 더 큰 가치를 만듭니다.',
      accentLabel: 'What We Deliver',
    ),
    CorporateInfoCardData(
      title: 'Approach',
      body:
          '현장의 운영 흐름을 먼저 이해하고, 자동화와 검색이 필요한 지점을 분리해 가장 현실적인 구조로 제안합니다. 제품 설명보다 실제 적용 가능성을 더 중요하게 봅니다.',
      accentLabel: 'How We Work',
    ),
  ];

  static const List<CorporateInfoCardData> strengthCards = [
    CorporateInfoCardData(
      title: 'Hybrid Execution',
      body:
          'AISOpsFlow는 Core와 Runner를 분리해 보안 경계를 유지하면서도 자동화 실행을 이어갈 수 있도록 설계되었습니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: 'Embedded Knowledge',
      body:
          'Ainsoft RAG는 애플리케이션 안에 직접 들어가는 임베디드 RAG 구조로 운영 포털과 업무 시스템에 자연스럽게 통합됩니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: 'Pragmatic Delivery',
      body:
          '현장의 운영 문제를 빠르게 정리하고, 도입 가능한 범위부터 시작해 실제 효과가 나는 흐름으로 연결합니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> snapshotMetrics = [
    CorporateMetricData(value: '2', label: 'Core Products'),
    CorporateMetricData(value: 'Ops + RAG', label: 'Integrated Strategy'),
    CorporateMetricData(value: 'Hybrid + Embedded', label: 'Product DNA'),
  ];
}

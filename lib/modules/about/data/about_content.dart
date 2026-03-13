import '/modules/home/models/corporate_content_models.dart';

class AboutContent {
  AboutContent._();

  static const String founderName = '박영규';

  static const String founderRole = '대표 / Senior Software Engineer';

  static const String founderLocation = '전라남도 나주시, 대한민국';

  static const String founderEducation =
      '퀸즐랜드 대학교 경제학 석사 · 안동대학교 행정학/정보통신공학 복수전공';

  static const List<String> founderIntroParagraphs = [
    '깔끔한 아키텍처와 실용적인 도구, 그리고 고객·동료와의 긴밀한 협업으로 실제 문제를 해결하는 것을 즐기는 시니어 소프트웨어 엔지니어입니다.',
    'JVM·Python 백엔드, 클라우드·DevOps, 데이터 집약 시스템, 로우코드·노코드 플랫폼까지 폭넓게 다뤄왔고 공공기관과 기업 환경에서 프로덕션 시스템을 꾸준히 구축해 왔습니다.',
    '지금은 AINSOFT에서 운영 자동화와 지식검색 제품을 직접 설계하고 구현하면서, 도입 가능성까지 고려한 현실적인 제품 경험을 만드는 데 집중하고 있습니다.',
  ];

  static const List<String> founderFocusTags = [
    'Google',
    '공공기관·엔터프라이즈',
    'JVM / Python',
    'AWS / Terraform',
    'Low-code / No-code',
    'Product Engineering',
  ];

  static const List<CorporateInfoCardData> founderHighlightCards = [
    CorporateInfoCardData(
      title: 'Product Builder',
      body:
          'Ainsoft와 FavoriteMedium에서 제품 설계부터 구현까지 직접 이끌며 운영 자동화, 지식검색, 시뮬레이션, 예약·시설 관리 서비스를 현실적인 도입 구조로 풀어냈습니다.',
      accentLabel: 'Recent Focus',
    ),
    CorporateInfoCardData(
      title: 'Enterprise Proven',
      body:
          'Google Android VTS, KEPCO 마이크로서비스, KOCCA 평가 플랫폼, 현대오토에버 ERP 연동 등 복잡한 엔터프라이즈·공공 시스템을 실제 운영 환경에 맞춰 구축했습니다.',
      accentLabel: 'Execution Context',
    ),
    CorporateInfoCardData(
      title: 'Wide Delivery Range',
      body:
          'Spring, Kotlin, Scala, Python, Angular, Appsmith, Terraform, GitHub Actions까지 아우르며 제품 개발과 운영 기반, 자동화 파이프라인을 함께 설계합니다.',
      accentLabel: 'Technical Range',
    ),
  ];

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
      body: '현장의 운영 문제를 빠르게 정리하고, 도입 가능한 범위부터 시작해 실제 효과가 나는 흐름으로 연결합니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> snapshotMetrics = [
    CorporateMetricData(value: '2', label: 'Core Products'),
    CorporateMetricData(value: 'Ops + RAG', label: 'Integrated Strategy'),
    CorporateMetricData(value: 'Hybrid + Embedded', label: 'Product DNA'),
  ];
}

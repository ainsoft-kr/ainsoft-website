import '/modules/home/models/corporate_content_models.dart';

class ProductsContent {
  ProductsContent._();

  static const List<CorporateInfoCardData> productCards = [
    CorporateInfoCardData(
      title: 'AISOpsFlow',
      body:
          'AISOpsFlow는 alerts → approval → actions → reporting 흐름을 중심으로 설계된 Ops/IT 자동화 플랫폼입니다. Haskell 기반 Core와 Runner 구조를 사용하고, 클라우드 Core와 고객사 온프레미스 Runner를 gRPC streaming + mTLS로 연결하며, Slack·Email·Telegram·Kakao 같은 채널 플러그인은 HTTP/JSON 계약으로 확장합니다.',
      accentLabel: 'Ops Automation',
    ),
    CorporateInfoCardData(
      title: 'Ainsoft RAG',
      body:
          'Ainsoft RAG는 Lucene 기반 임베디드 RAG 엔진과 Spring Boot starter 제품군으로 구성된 지식검색 플랫폼입니다. hybrid retrieval, ACL, snapshot/restore, contextual indexing, reranker, corrective retrieval, hierarchical summaries를 포함하며, chunker·embedding·parser·reranker 모듈을 조합하거나 starter로 바로 애플리케이션에 연결할 수 있습니다.',
      accentLabel: 'Knowledge Retrieval',
    ),
  ];

  static const List<CorporateInfoCardData> valueCards = [
    CorporateInfoCardData(
      title: '제품 구성 원칙',
      body:
          'AISOpsFlow는 Core, Runner, Plugin 구조로 나뉘고, Ainsoft RAG는 engine, pipeline modules, starter 구조로 나뉩니다. 각 제품은 역할이 분명한 컴포넌트 조합으로 설계되어 도입 구조를 이해하기 쉽습니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '배포와 통합 방식',
      body:
          'AISOpsFlow는 Core ↔ Runner 하이브리드 배포와 플러그인 연계를, Ainsoft RAG는 embedded engine 과 Spring Boot starter 연계를 중심으로 구성됩니다. 기존 운영 환경과 애플리케이션에 자연스럽게 연결할 수 있는 방식입니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '확장 포인트',
      body:
          'AISOpsFlow는 Plugin SDK 와 Catalog 로 채널과 도구를 확장하고, Ainsoft RAG는 chunker, embedding, parser, reranker 모듈 조합으로 검색 품질을 확장합니다. 제품이 성장할수록 확장성이 더 큰 차이를 만듭니다.',
      dark: true,
    ),
  ];

  static const List<CorporateInfoCardData> aisopsflowCards = [
    CorporateInfoCardData(
      title: 'Enterprise Core + Runner',
      body:
          'AISOpsFlow의 제품 구조는 클라우드 Core와 고객사 온프레미스 Runner를 분리하는 방식입니다. Core는 정책과 제어를 담당하고, Runner는 고객 환경 내부에서 실제 실행을 담당해 보안 경계를 유지한 채 자동화를 수행할 수 있습니다. 공개된 확장 자산은 Plugin SDK 와 Plugin Catalog 저장소로 확인할 수 있습니다.',
      accentLabel: 'Hybrid Runtime',
    ),
    CorporateInfoCardData(
      title: 'Workflow-first Automation',
      body:
          '제품의 중심은 알림 화면이 아니라 워크플로우입니다. alerts → approval → actions → reporting 흐름을 명시적으로 다루기 때문에 운영팀이 실제 절차를 제품 안에서 표준화하고 재사용하기 좋습니다.',
      accentLabel: 'Workflow',
    ),
    CorporateInfoCardData(
      title: 'Plugin Ecosystem',
      body:
          'Enterprise 리포지토리와 별도로 Plugin SDK, Plugin Catalog가 나뉘어 있어 채널/도구 확장 전략이 분명합니다. Slack, Email, Telegram, Kakao 같은 플러그인을 계약 기반으로 운영할 수 있습니다.\n\nPlugin SDK\nhttps://github.com/ainsoft-kr/aisopsflow-plugin-sdk\n\nPlugin Catalog\nhttps://github.com/ainsoft-kr/aisopsflow-plugin-catalog',
      accentLabel: 'SDK + Catalog',
    ),
  ];

  static const List<CorporateInfoCardData> ragCards = [
    CorporateInfoCardData(
      title: 'Lucene Embedded Engine',
      body:
          'Ainsoft RAG는 Lucene 기반 임베디드 엔진을 중심으로 설계되어 애플리케이션 내부에 직접 검색 계층을 포함시킬 수 있습니다. 외부 검색 서비스 의존성을 줄이면서도 서비스 로직과 가까운 위치에서 RAG를 운영할 수 있습니다.',
      accentLabel: 'Engine',
      dark: true,
    ),
    CorporateInfoCardData(
      title: 'Composable Retrieval Pipeline',
      body:
          'chunker, embedding provider, parser, reranker, corrective retrieval, hierarchical summaries 구성이 모듈로 나뉘어 있어 검색 품질 전략을 단계적으로 조정할 수 있습니다. 단순 벡터 검색이 아니라 파이프라인형 품질 제어에 가깝습니다.',
      accentLabel: 'Pipeline',
      dark: true,
    ),
    CorporateInfoCardData(
      title: 'Spring Boot Starter',
      body:
          '엔진 모듈을 직접 조합할 수도 있지만 starter/autoconfigure 제품군을 통해 Spring Boot 애플리케이션에 바로 연결할 수도 있습니다. 사내 서비스, 포털, 관리자 시스템에 내장형 RAG를 붙이는 데 적합합니다.\n\nSpring Boot autoconfigure\nhttps://github.com/ainsoft-kr/ainsoft-rag-spring-boot-autoconfigure\n\nSpring Boot starter\nhttps://github.com/ainsoft-kr/ainsoft-rag-spring-boot-starter',
      accentLabel: 'Starter',
      dark: true,
    ),
  ];

  static const List<CorporateInfoCardData> productFitCards = [
    CorporateInfoCardData(
      title: 'AISOpsFlow',
      body:
          '정책과 제어는 Core에서, 실제 실행은 Runner에서 담당합니다. 보안 경계를 유지하면서 운영 자동화를 도입해야 하는 환경에 적합합니다.',
    ),
    CorporateInfoCardData(
      title: 'Ainsoft RAG',
      body:
          '엔진 모듈을 직접 조합하거나 starter/autoconfigure 로 통합할 수 있어 서비스, 포털, 관리자 시스템에 내장형 검색 경험을 빠르게 붙일 수 있습니다.',
    ),
    CorporateInfoCardData(
      title: 'Combined Value',
      body:
          'AISOpsFlow는 실행 시스템, Ainsoft RAG는 검색 시스템입니다. 역할이 분명하기 때문에 단독으로도 강하고 함께 사용할 때 더 선명한 운영 경험을 만듭니다.',
    ),
  ];

  static const List<CorporateInfoCardData> openSourceCards = [
    CorporateInfoCardData(
      title: 'Ainsoft RAG Open Source',
      body:
          'Spring Boot autoconfigure\nhttps://github.com/ainsoft-kr/ainsoft-rag-spring-boot-autoconfigure\n\nSpring Boot starter\nhttps://github.com/ainsoft-kr/ainsoft-rag-spring-boot-starter',
      accentLabel: 'GitHub',
    ),
    CorporateInfoCardData(
      title: 'AISOpsFlow Open Source',
      body:
          'Plugin SDK\nhttps://github.com/ainsoft-kr/aisopsflow-plugin-sdk\n\nPlugin Catalog\nhttps://github.com/ainsoft-kr/aisopsflow-plugin-catalog',
      accentLabel: 'GitHub',
    ),
  ];

  static const List<CorporateMetricData> metrics = [
    CorporateMetricData(value: '2', label: '핵심 제품 라인'),
    CorporateMetricData(value: 'Core ↔ Runner', label: 'AISOpsFlow 구조'),
    CorporateMetricData(value: 'Lucene Engine', label: 'Ainsoft RAG 구조'),
    CorporateMetricData(value: 'Starter + SDK', label: '통합/확장 방식'),
  ];
}

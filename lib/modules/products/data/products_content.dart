import '/modules/home/models/corporate_content_models.dart';

class ProductsContent {
  ProductsContent._();

  static const List<SiteCardData> productCards = [
    SiteCardData(
      kind: '운영 자동화',
      title: 'AISOpsFlow',
      body: '알림 이후의 승인, 실행, 보고를 하나의 워크플로우로 자동화합니다.',
      items: [
        ('반복 대응을 표준 절차로', '알림 → 승인 → 실행 → 보고를 정해진 흐름대로 처리'),
        ('실행은 고객사 안에서', '제어는 클라우드, 실제 실행은 사내 Runner가 담당'),
        ('쓰던 채널 그대로', 'Slack · 이메일 · 텔레그램 · 카카오 연동'),
      ],
    ),
    SiteCardData(
      kind: '지식검색',
      title: 'Ainsoft RAG',
      body: '흩어진 매뉴얼, 정책, 장애 이력을 바로 찾을 수 있는 판단 근거로 만듭니다.',
      items: [
        ('문서를 한 번에 검색', '매뉴얼 · 정책 · 장애 이력을 근거와 함께 제시'),
        ('권한대로만 보이게', '접근 권한에 따라 볼 수 있는 문서만 검색'),
        ('서비스 안에 내장', '사내 포털 · 관리자 시스템에 검색 기능으로 탑재'),
      ],
    ),
  ];

  static const List<(String, String, String?)> adoptionOptions = [
    ('AISOpsFlow만', '반복 대응 자동화가 먼저 필요한 운영팀', null),
    ('Ainsoft RAG만', '사내 문서 검색과 질의응답이 먼저 필요한 조직', null),
    ('함께', '알림부터 근거 확인, 실행, 보고까지 한 흐름으로', '추천'),
  ];

  static const List<SiteSpecData> aisopsflowSpecs = [
    SiteSpecData('워크플로우', 'alerts → approval → actions → reporting'),
    SiteSpecData(
      '실행 구조',
      '클라우드 Core(정책 · 제어) + 고객사 온프레미스 Runner(실행). Core와 Runner는 Haskell 기반입니다.',
    ),
    SiteSpecData('연결', 'Core ↔ Runner 간 gRPC streaming + mTLS'),
    SiteSpecData(
      '확장',
      'Plugin SDK와 Plugin Catalog. Slack · Email · Telegram · Kakao 같은 채널 플러그인은 HTTP/JSON 계약으로 연결합니다.',
    ),
  ];

  static const List<SiteSpecData> ragSpecs = [
    SiteSpecData('엔진', 'Lucene 기반 임베디드 RAG 엔진. 외부 검색 서비스 없이 애플리케이션 안에서 동작합니다.'),
    SiteSpecData(
      '검색 품질',
      'hybrid retrieval, contextual indexing, reranker, corrective retrieval, hierarchical summaries',
    ),
    SiteSpecData('운영', 'ACL 기반 접근 제어, snapshot / restore'),
    SiteSpecData(
      '통합',
      'chunker · embedding · parser · reranker 모듈을 직접 조합하거나 Spring Boot starter / autoconfigure로 바로 연결합니다.',
    ),
  ];

  static const List<SiteRepoData> aisopsflowRepos = [
    SiteRepoData(
      name: 'AISOpsFlow Plugin SDK',
      url: 'https://github.com/ainsoft-kr/aisopsflow-plugin-sdk',
    ),
    SiteRepoData(
      name: 'AISOpsFlow Plugin Catalog',
      url: 'https://github.com/ainsoft-kr/aisopsflow-plugin-catalog',
    ),
  ];

  static const List<SiteRepoData> ragRepos = [
    SiteRepoData(
      name: 'Ainsoft RAG Spring Boot Starter',
      url: 'https://github.com/ainsoft-kr/ainsoft-rag-spring-boot-starter',
    ),
    SiteRepoData(
      name: 'Ainsoft RAG Spring Boot Autoconfigure',
      url:
          'https://github.com/ainsoft-kr/ainsoft-rag-spring-boot-autoconfigure',
    ),
  ];
}

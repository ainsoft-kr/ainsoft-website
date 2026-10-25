import '/modules/home/models/corporate_content_models.dart';

class SolutionsContent {
  SolutionsContent._();

  static const List<CorporateInfoCardData> solutionCards = [
    CorporateInfoCardData(
      title: 'IT 운영 / 관제 조직',
      body:
          '반복 알림 대응이 많은 운영센터에서는 AISOpsFlow로 승인·실행 절차를 자동화하고, Ainsoft RAG로 장애 이력과 운영 매뉴얼을 바로 검색하게 하는 구성이 적합합니다.',
      accentLabel: 'NOC / SOC',
    ),
    CorporateInfoCardData(
      title: '서비스데스크 / 헬프데스크',
      body:
          '반복 티켓은 AISOpsFlow 워크플로우로 자동 분기하고, 복잡한 예외 문의는 Ainsoft RAG로 정책과 매뉴얼을 찾아 응답 품질을 높이는 식의 업무 설계가 가능합니다.',
      accentLabel: 'Service Desk',
    ),
    CorporateInfoCardData(
      title: '규제 산업 / 온프레미스 환경',
      body:
          '외부 반출이 어려운 환경에서는 AISOpsFlow Runner를 내부에서 실행하고, Ainsoft RAG는 ACL 기반 지식검색으로 내부 문서만 조회하게 하는 구성으로 보안 요구사항에 대응할 수 있습니다.',
      accentLabel: 'On-prem',
    ),
    CorporateInfoCardData(
      title: '사내 업무 포털 / 관리자 시스템',
      body:
          '사내 포털이나 관리자 시스템에서는 Ainsoft RAG를 통해 문서검색 기능을 내장하고, AISOpsFlow를 통해 알림 승인이나 운영 액션 요청을 연결하는 방식으로 업무 흐름을 짤 수 있습니다.',
      accentLabel: 'Internal Portal',
    ),
  ];

  static const List<CorporateInfoCardData> aisopsflowCards = [
    CorporateInfoCardData(
      title: '운영 담당자 업무 예시',
      body:
          '운영 담당자는 AISOpsFlow로 알림 이후 승인과 실행 절차를 처리하고, 동시에 Ainsoft RAG로 관련 운영 문서와 과거 처리 이력을 검색해 더 빠르게 판단할 수 있습니다.',
      accentLabel: 'Ops Manager',
    ),
    CorporateInfoCardData(
      title: '헬프데스크 담당자 업무 예시',
      body:
          '헬프데스크 담당자는 반복 티켓은 자동화 흐름으로 넘기고, 답변이 필요한 문의는 Ainsoft RAG에서 정책과 매뉴얼을 검색해 응답 근거를 확보할 수 있습니다.',
      accentLabel: 'Help Desk',
    ),
    CorporateInfoCardData(
      title: '보안/컴플라이언스 담당자 업무 예시',
      body:
          '민감 환경에서는 AISOpsFlow의 Runner 분리 구조와 Ainsoft RAG의 ACL 검색을 함께 활용해 실행과 지식 접근을 모두 정책 통제 안에서 운영할 수 있습니다.',
      accentLabel: 'Compliance',
    ),
  ];

  static const List<CorporateInfoCardData> ragCards = [
    CorporateInfoCardData(
      title: '장애 대응 시나리오',
      body:
          '장애 알림이 들어오면 AISOpsFlow가 승인과 실행 절차를 관리하고, Ainsoft RAG가 장애 매뉴얼과 유사 사례를 검색해 운영자가 바로 참고할 수 있도록 돕는 시나리오입니다.',
      accentLabel: 'Incident Response',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '운영 지식 검색 시나리오',
      body:
          '사내 운영 포털이나 관리자 시스템에서 Ainsoft RAG가 문서검색과 근거 제공을 맡고, 필요 시 AISOpsFlow로 실제 작업 요청이나 승인 플로우를 이어붙이는 시나리오입니다.',
      accentLabel: 'Knowledge Search',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '채널 연계 자동화 시나리오',
      body:
          'Slack, Email, Telegram, Kakao 같은 채널과 연결된 AISOpsFlow 워크플로우 위에 Ainsoft RAG 검색 근거를 붙이면, 알림과 실행, 참고 지식이 같은 흐름 안에서 제공됩니다.',
      accentLabel: 'Channel Ops',
      dark: true,
    ),
  ];

  static const List<CorporateInfoCardData> combinedCards = [
    CorporateInfoCardData(
      title: '운영 관제 + 지식검색 결합',
      body:
          '관제 조직에서는 AISOpsFlow가 이벤트 대응 흐름을 제어하고, Ainsoft RAG가 관련 매뉴얼과 장애 이력을 검색해 근거를 제공합니다. 실행 자동화와 판단 보조가 하나의 운영 흐름으로 연결됩니다.',
      accentLabel: 'NOC / SOC',
    ),
    CorporateInfoCardData(
      title: '서비스데스크 자동화',
      body:
          '반복 티켓은 AISOpsFlow 워크플로우로 분기하고, 예외 상황이나 복잡한 문의는 Ainsoft RAG로 문서 근거를 찾아 응답 품질을 높일 수 있습니다. 사람 개입이 필요한 구간과 자동화 구간을 분리하기 좋습니다.',
      accentLabel: 'Service Desk',
    ),
    CorporateInfoCardData(
      title: '사내 운영 코파일럿',
      body:
          '운영자가 채널 플러그인으로 승인/실행을 처리하고, 동시에 RAG 검색으로 정책과 변경 이력을 확인하는 구조를 만들 수 있습니다. 내부 운영 지식을 실제 액션과 연결하는 형태의 코파일럿 시나리오입니다.',
      accentLabel: 'Copilot',
    ),
  ];

  static const List<CorporateInfoCardData> approachCards = [
    CorporateInfoCardData(
      title: '현장 중심 설계',
      body:
          'IT 운영, 서비스데스크, 내부 포털, 규제 환경처럼 각 조직이 실제로 겪는 흐름을 기준으로 솔루션을 설계합니다. 현장의 문제를 먼저 풀어야 자동화가 살아납니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '자동화와 검색의 결합',
      body:
          'AISOpsFlow는 실행과 승인 흐름을 담당하고, Ainsoft RAG는 문서와 정책, 이력 검색을 담당합니다. 두 제품을 함께 쓰면 판단과 실행이 더 매끄럽게 이어집니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '빠른 현업 안착',
      body:
          '운영담당자, 헬프데스크, 보안담당자처럼 각 역할에 맞는 적용 장면을 제시해 실제 업무에 바로 연결될 수 있는 형태로 정리합니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> deliveryMetrics = [
    CorporateMetricData(value: 'IT Ops', label: '관제/운영 시나리오'),
    CorporateMetricData(value: 'Help Desk', label: '문의/티켓 시나리오'),
    CorporateMetricData(value: 'On-prem', label: '규제 환경 시나리오'),
    CorporateMetricData(value: 'Internal Portal', label: '사내 시스템 시나리오'),
  ];
}

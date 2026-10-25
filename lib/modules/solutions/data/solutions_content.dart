import '/modules/home/models/corporate_content_models.dart';

class SolutionsContent {
  SolutionsContent._();

  static const List<SiteScenarioData> teamScenarios = [
    SiteScenarioData(
      who: 'IT 운영 · 관제',
      kind: '제품',
      title: '반복되는 장애 알림',
      before: '알림마다 당직자가 매뉴얼을 찾고, 승인과 조치를 직접 진행',
      after: '승인 · 실행 절차는 자동으로, 장애 이력과 매뉴얼은 바로 검색',
    ),
    SiteScenarioData(
      who: '서비스데스크',
      kind: '제품',
      title: '매일 쌓이는 같은 유형의 티켓',
      before: '같은 요청을 사람이 하나씩 분류하고 처리',
      after: '반복 티켓은 자동 분기, 예외 문의만 정책 근거와 함께 사람에게',
    ),
    SiteScenarioData(
      who: '사내 포털 · 관리자 시스템',
      kind: '제품',
      title: '여기저기 흩어진 사내 문서',
      before: '문서를 찾으러 여러 시스템을 오가고, 요청은 메일로 따로',
      after: '포털 안에서 문서를 검색하고, 승인과 작업 요청까지 바로 연결',
    ),
    SiteScenarioData(
      who: '규제 산업 · 온프레미스',
      kind: '제품 + 구축',
      title: '데이터를 밖으로 못 내보내는 환경',
      before: '보안 정책 때문에 자동화와 AI 도입을 미룸',
      after: '실행은 사내 Runner에서, 검색은 권한 범위의 내부 문서만',
    ),
    SiteScenarioData(
      who: '제조 · 안전관제',
      kind: '구축 서비스',
      title: '매일 쌓이는 검사 이미지와 영상',
      before: '검사자가 이미지와 영상을 하나씩 눈으로 확인',
      after: 'AI가 이상 징후만 골라 근거와 함께 알림',
    ),
    SiteScenarioData(
      who: '법무 · 기술 문서',
      kind: '구축 서비스',
      title: '문서 속에 묻힌 답',
      before: '스캔 문서와 검사 리포트를 직접 열어 확인',
      after: '질문하면 해당 문서와 근거를 함께 답변',
    ),
  ];

  static const List<(String, String)> roles = [
    ('운영 담당자', '알림 이후 승인과 실행은 워크플로우에 맡기고, 관련 문서와 과거 처리 이력을 보며 판단에 집중합니다.'),
    ('헬프데스크 담당자', '반복 티켓은 자동 흐름으로 넘기고, 어려운 문의는 정책과 매뉴얼 근거를 찾아 답합니다.'),
    ('보안 · 컴플라이언스 담당자', '실행과 지식 접근이 모두 사내 정책과 권한 통제 안에서 이루어지는지 확인합니다.'),
  ];
}

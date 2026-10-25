class ContactContent {
  ContactContent._();

  static const String email = 'admin@ain.ai.kr';
  static const String phone = '+82 10-2146-0818';
  static const String replyPromise = '확인 후 1일 안에 회신드립니다.';

  static const List<(String, String)> checklist = [
    ('적용하려는 업무', '예: 야간 장애 대응, 반복 티켓 처리, 검사 이미지 판독'),
    ('현재 환경', '예: 사용 중인 모니터링 · 메신저 도구, 클라우드 또는 온프레미스'),
    ('희망 일정', '예: 이번 분기 안에 PoC, 내년 상반기 도입'),
  ];

  static const List<(String, String)> topics = [
    ('제품 도입', 'AISOpsFlow, Ainsoft RAG, 또는 두 제품을 함께 쓰는 구성이 우리 환경에 맞는지 검토합니다.'),
    ('AI 구축', '현장 이미지 · 영상 · 문서 AI나 사내 LLM을 어떤 구조로 만들지 함께 설계합니다.'),
    ('PoC · 데모', '실제 업무 흐름을 기준으로 데모를 보여드리고 PoC 범위를 정합니다.'),
    ('협업 · 파트너십', '플러그인 확장, 시스템 통합, 온프레미스 배치 같은 협업을 논의합니다.'),
  ];

  static const String mailSubject = '[도입 상담] 회사명 / 담당자명';

  static String get mailBody => [
    '안녕하세요, AINSOFT에 도입 상담을 요청합니다.',
    '',
    for (final (title, _) in checklist) ...['■ $title:', ''],
    '■ 연락처:',
  ].join('\n');
}

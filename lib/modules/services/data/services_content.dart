import '/modules/home/models/corporate_content_models.dart';

class ServicesContent {
  ServicesContent._();

  static const List<SiteCardData> buildAreas = [
    SiteCardData(
      kind: '이미지 · 영상',
      title: '현장 시각 AI',
      body: '공정과 안전 현장의 이미지와 영상을 해석해 이상 징후를 찾아냅니다.',
      items: [
        ('생산공정 분석', '이미지 · 영상 · 리포트로 공정 상태 해석'),
        ('안전관제', '위험 상황과 점검 포인트 식별'),
        ('장비 · 표면 검사', '고장 유무 관제, 표면 처리 분석, QR 자동 분류'),
      ],
    ),
    SiteCardData(
      kind: '문서',
      title: '문서 · 도면 AI',
      body: '법률 · 기술 문서와 검사 리포트를 질문에 답하는 지식 자산으로 바꿉니다.',
      items: [
        ('문서 질의응답', '스캔 문서 · 검사표 · 작업 지시서 해석'),
        ('정보 수집', '법률 · 기술 문서를 모으고 정리'),
        ('근거 기반 응답', 'Ainsoft RAG와 결합해 출처와 함께 답변'),
      ],
    ),
    SiteCardData(
      kind: '사내 LLM',
      title: '사내 LLM 구축',
      body: '데이터를 밖으로 내보내지 않는 LLM을 사내 서버나 현장 장비에 구축합니다.',
      items: [
        ('사내 AI Assistant', '온프레미스에서 동작하는 업무 도우미'),
        ('사내 LLM API', '여러 사용자가 동시에 쓰는 고성능 서빙'),
        ('엣지 · 경량 추론', 'GPU가 부족한 현장 단말과 오프라인 환경'),
      ],
    ),
  ];

  static const List<(String, String)> extendedAreas = [
    ('원격 계측 · 정밀 측정', '카메라 · 깊이 센서 · 레이저 측정 체계 위에 판독과 리포트 생성을 더합니다.'),
    ('열 관리 · 공정 제어 보조', '열화상과 PLC · MES 데이터를 함께 해석하는 보조 계층을 둡니다.'),
    ('공정 흐름 · 이동시간 분석', '이벤트 로그와 위치 데이터 분석에 현장 장면 요약을 결합합니다.'),
    ('AR 작업지원', '3D · CAD 기반 작업 가이드에 장비 화면 인식과 질의응답을 더합니다.'),
    ('음성 · 영상 위험 알림', '음성 인식 모델과 현장 영상을 함께 보는 위험 판단 서비스입니다.'),
  ];

  static const List<SiteSpecData> modelSpecs = [
    SiteSpecData(
      '문서 이해',
      'OCR, DocVQA, ChartQA, InfoVQA — 스캔 문서, 표, 차트, 리포트 해석',
    ),
    SiteSpecData('현장 이해', 'single-image, multi-image, video 입력 지원'),
    SiteSpecData(
      '공개 벤치마크 (InternVL2-Pro)',
      'DocVQA 95.1 · ChartQA 87.1 · OCRBench 837 (InternVL 공식 공개 자료 기준)',
    ),
    SiteSpecData('설계 원칙', '측정 · 제어 시스템을 대체하지 않고, 해석 · 설명 · 질의응답 계층으로 결합합니다.'),
  ];

  static const List<SiteSpecData> stackSpecs = [
    SiteSpecData('Ollama', '로컬 · 사내 서버 배포. PoC, 내부 챗봇, 문서 질의응답의 시작점'),
    SiteSpecData('vLLM', '동시 요청이 많은 사내 LLM API, 대규모 RAG 백엔드'),
    SiteSpecData('BitNet', '저전력 · 비용 민감 환경을 위한 경량 모델 실험'),
    SiteSpecData('llama.cpp', 'CPU · 엣지 · 오프라인 환경의 경량 추론'),
    SiteSpecData(
      '구성 예',
      'InternVL이 이미지 · 영상 · 문서를 이해하고, vLLM 또는 Ollama가 응답을 만들고, Ainsoft RAG와 AISOpsFlow가 검색과 실행을 연결합니다.',
    ),
  ];

  static const List<SiteRepoData> modelRepos = [
    SiteRepoData(
      name: 'InternVL',
      url: 'https://github.com/OpenGVLab/InternVL',
    ),
  ];

  static const List<SiteRepoData> stackRepos = [
    SiteRepoData(name: 'Ollama', url: 'https://github.com/ollama/ollama'),
    SiteRepoData(name: 'vLLM', url: 'https://github.com/vllm-project/vllm'),
    SiteRepoData(name: 'BitNet', url: 'https://github.com/microsoft/BitNet'),
    SiteRepoData(
      name: 'llama.cpp',
      url: 'https://github.com/ggml-org/llama.cpp',
    ),
  ];
}

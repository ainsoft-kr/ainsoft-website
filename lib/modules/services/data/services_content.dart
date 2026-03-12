import '/modules/home/models/corporate_content_models.dart';

class ServicesContent {
  ServicesContent._();

  static const List<CorporateInfoCardData> overviewCards = [
    CorporateInfoCardData(
      title: '멀티모달 생산공정 분석',
      body:
          '생산 현장의 이미지, 영상, 표, 리포트, 작업 문서를 함께 읽어 공정 상태를 해석하고 이상 징후를 빠르게 찾는 서비스를 설계할 수 있습니다.',
      accentLabel: 'Manufacturing AI',
    ),
    CorporateInfoCardData(
      title: '안전관제 시각지능',
      body:
          '안전관제 카메라, 설비 점검 이미지, 작업 현장 영상을 기반으로 위험 상황과 점검 포인트를 더 빠르게 식별하는 멀티모달 서비스를 구축할 수 있습니다.',
      accentLabel: 'Safety Monitoring',
    ),
    CorporateInfoCardData(
      title: '문서·도면·지식 서비스',
      body:
          '법률 문서, 기술 문서, 작업 매뉴얼, 검사 리포트를 검색 가능한 지식 자산으로 바꾸고 현장 질의응답과 운영 지원으로 연결할 수 있습니다.',
      accentLabel: 'Document Intelligence',
    ),
  ];

  static const List<CorporateInfoCardData> internvlCards = [
    CorporateInfoCardData(
      title: '문서·표·도면 이해',
      body:
          'InternVL 공식 자료는 OCR, DocVQA, ChartQA, InfoVQA 강점을 공개하고 있어 스캔 문서, 검사표, 작업 지시서, 기술 표와 리포트 해석의 기반 모델로 적합합니다.',
      accentLabel: 'OCR + VQA',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '현장 이미지·영상 이해',
      body:
          'InternVL은 single-image, multi-image, video 입력을 지원하므로 안전관제, 장비 점검, 주행 보조, 작업자 안전 모니터링처럼 현장 장면을 해석하는 서비스의 기반으로 사용할 수 있습니다.',
      accentLabel: 'Image + Video',
      dark: true,
    ),
    CorporateInfoCardData(
      title: 'RAG·Workflow 확장',
      body:
          '멀티모달 이해는 InternVL이 맡고, 문서 검색은 Ainsoft RAG가, 실행 자동화는 AISOpsFlow가 맡는 구조로 연결하면 실제 업무 서비스로 확장하기 좋습니다.',
      accentLabel: 'AINSOFT Stack',
      dark: true,
    ),
  ];

  static const List<CorporateInfoCardData> llmServiceCards = [
    CorporateInfoCardData(
      title: 'Ollama 기반 사내 LLM 배포',
      body:
          '개발팀과 현업이 빠르게 로컬 또는 사내 서버에서 모델을 실행해볼 수 있도록 Ollama 기반 배포 환경을 설계할 수 있습니다. PoC, 내부 챗봇, 문서 질의응답, 경량 추론 서비스 시작점으로 적합합니다.\n\nhttps://github.com/ollama/ollama',
      accentLabel: 'Local LLM',
    ),
    CorporateInfoCardData(
      title: 'vLLM 기반 고성능 서빙',
      body:
          '동시 요청 처리량이 중요하거나 API 응답 성능이 필요한 환경에서는 vLLM 기반 고성능 추론 서버 구성이 적합합니다. 사내 LLM API, 대규모 RAG 백엔드, 멀티유저 챗 서비스 같은 구조에 맞춰 설계할 수 있습니다.\n\nhttps://github.com/vllm-project/vllm',
      accentLabel: 'High Throughput',
    ),
    CorporateInfoCardData(
      title: 'BitNet / 경량 모델 실험',
      body:
          '저전력, 경량화, 효율적인 모델 구조가 필요한 경우 BitNet 계열을 포함한 경량 LLM 실험 환경을 제안할 수 있습니다. 현장 장비, 제한된 인프라, 비용 민감한 배포 환경에서 검토할 수 있는 축입니다.\n\nhttps://github.com/microsoft/BitNet',
      accentLabel: 'Efficient Models',
    ),
    CorporateInfoCardData(
      title: 'llama.cpp 기반 온프레미스·엣지 추론',
      body:
          'GPU 자원이 제한적이거나 CPU·엣지 환경에서 LLM을 운영해야 하는 경우 llama.cpp 기반 추론 구조가 유효합니다. 온프레미스 서버, 산업 현장 단말, 오프라인 환경에 맞는 경량 추론 아키텍처를 설계할 수 있습니다.\n\nhttps://github.com/ggml-org/llama.cpp',
      accentLabel: 'Edge Inference',
    ),
  ];

  static const List<CorporateInfoCardData> readyServiceCards = [
    CorporateInfoCardData(
      title: '생성형 AI 생산공정 분석',
      body:
          '현장 이미지, 작업 기록, 공정 문서를 함께 읽어 생산 흐름을 요약하고 병목 지점, 품질 이슈, 반복 오류 패턴을 분석하는 서비스로 확장할 수 있습니다. 공정 리포트 생성과 프로세스 진단 자동화까지 연결하기 좋은 영역입니다.',
      accentLabel: 'Direct Fit',
    ),
    CorporateInfoCardData(
      title: '안전관제 이미지 처리 경량 시스템',
      body:
          '경량 모델 또는 최적화된 배포 구성을 사용하면 안전관제 이미지 분류, 위험 장면 요약, 이벤트 설명 생성 같은 시각지능 서비스를 구현할 수 있습니다. 현장 단말, 엣지 서버, 중앙 서버 구조에 맞춰 경량화 전략을 설계할 수 있습니다.',
      accentLabel: 'Direct Fit',
    ),
    CorporateInfoCardData(
      title: '주행 안전 보조 / 장비 고장 유무 관제',
      body:
          '현장 영상과 설비 이미지를 해석해 위험 접근, 작업자 근접, 장비 외관 이상, 표시등 상태, 점검 필요 여부를 보조 판단하는 서비스로 설계할 수 있습니다. 단, 안전 제어 자체는 별도 제어 로직과 연동하는 구조가 적합합니다.',
      accentLabel: 'Direct Fit',
    ),
    CorporateInfoCardData(
      title: '표면 처리 지점 AI 분석 / QR 자동 분류',
      body:
          '고해상도 이미지 이해와 OCR 능력을 활용해 표면 처리 대상 지점 검토, 표식 판독, QR 자동 분류, 검사 사진 기반 판단 보조 서비스를 구현할 수 있습니다.',
      accentLabel: 'Direct Fit',
    ),
    CorporateInfoCardData(
      title: '법률·기술 문서 AI 서비스 / 정보 수집',
      body:
          '법률 문서, 기술 자료, 시장 정보, 표와 리포트를 수집·정리하고 멀티모달 검색과 질의응답으로 제공하는 서비스가 가능합니다. 이 영역은 InternVL과 Ainsoft RAG를 함께 쓰는 구성이 특히 적합합니다.',
      accentLabel: 'Direct Fit',
    ),
  ];

  static const List<CorporateInfoCardData> extendedServiceCards = [
    CorporateInfoCardData(
      title: '원격 계측·정밀 측정 서비스',
      body:
          '정밀 두께 측정, 치수 판독, 표면 상태 판정, 비전 기반 검사 같은 과제는 InternVL만으로 직접 해결하기보다 보정된 카메라, 깊이 센서, 레이저 측정, 기준 패턴과 같은 계측 체계가 함께 필요합니다. InternVL은 측정 화면 해석, 이상 패턴 설명, 리포트 생성 계층에서 보조 모델로 활용하는 편이 현실적입니다.',
    ),
    CorporateInfoCardData(
      title: '열 관리·공정 제어 보조 서비스',
      body:
          '가열, 냉각, 건조, 예열, 온도 유지 같은 제조 공정은 열화상, 센서 데이터, PLC·MES 연동, 제어 로직이 핵심입니다. InternVL은 열화상 이미지와 작업 문서를 함께 해석하는 보조 계층으로 활용할 수 있지만, 제어 시스템 자체를 대체하지는 않습니다.',
    ),
    CorporateInfoCardData(
      title: '공정 흐름·이동시간 빅데이터 분석',
      body:
          '작업물 이동시간, 공정 체류시간, 병목 구간 분석은 영상 이해만으로 끝나지 않고 공정 이벤트 로그, 위치 데이터, 시계열 분석, 프로세스 마이닝이 함께 필요합니다. InternVL은 현장 장면 요약과 문서 질의응답에, 분석 엔진은 별도 데이터 파이프라인에 두는 구조가 적합합니다.',
    ),
    CorporateInfoCardData(
      title: 'AR 작업지원·가상 제작 보조 서비스',
      body:
          'AR 매뉴얼, 디지털 작업 가이드, 가상 조립, 시뮬레이션 기반 검토는 3D 모델, CAD 데이터, 공간 정합, 렌더링 엔진이 필요합니다. InternVL은 장비 화면 인식, 작업 단계 설명, 현장 질의응답을 맡는 보조 지능 계층으로 결합할 수 있습니다.',
    ),
    CorporateInfoCardData(
      title: '음성·영상 기반 위험 알림 서비스',
      body:
          '이 영역은 음성 인식과 음성 위험도 분석 모델이 핵심이며, InternVL 단독보다는 ASR·음성분석 모델과의 멀티모달 결합이 필요합니다. 작업자 음성, 현장 소음, 경고 방송, 현장 영상을 함께 보는 사고 위험 판단 서비스로는 확장 가능합니다.',
    ),
  ];

  static const List<CorporateInfoCardData> llmStackCards = [
    CorporateInfoCardData(
      title: '사내 RAG / 문서 질의응답',
      body:
          'Ollama 또는 vLLM 기반 LLM 서빙 위에 Ainsoft RAG를 결합해 내부 문서 검색과 근거 기반 응답 서비스를 구축할 수 있습니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '온프레미스 AI Assistant',
      body:
          'llama.cpp, Ollama, 경량 모델 구성을 조합해 외부 반출이 어려운 환경에서도 동작하는 온프레미스 AI Assistant 구조를 설계할 수 있습니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '멀티모달 + LLM 서비스',
      body:
          'InternVL이 이미지·영상·문서를 이해하고, vLLM 또는 Ollama가 언어 응답을 담당하며, Ainsoft RAG와 AISOpsFlow가 검색과 실행을 연결하는 확장 구조도 가능합니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> internvlMetrics = [
    CorporateMetricData(value: '95.1', label: 'DocVQA (InternVL2-Pro)'),
    CorporateMetricData(value: '87.1', label: 'ChartQA (InternVL2-Pro)'),
    CorporateMetricData(value: '837', label: 'OCRBench (InternVL2-Pro)'),
    CorporateMetricData(value: 'Image + Video', label: '공식 지원 입력'),
  ];

  static const List<CorporateMetricData> llmMetrics = [
    CorporateMetricData(value: 'Ollama', label: '로컬·사내 배포'),
    CorporateMetricData(value: 'vLLM', label: '고성능 API 서빙'),
    CorporateMetricData(value: 'BitNet', label: '경량 모델 실험'),
    CorporateMetricData(value: 'llama.cpp', label: '온프레미스·엣지 추론'),
  ];
}

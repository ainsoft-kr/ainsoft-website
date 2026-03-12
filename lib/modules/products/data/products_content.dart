import '/modules/home/models/corporate_content_models.dart';

class ProductsContent {
  ProductsContent._();

  static const List<CorporateInfoCardData> productCards = [
    CorporateInfoCardData(
      title: 'Platform Suite',
      body: '핵심 업무를 하나의 흐름으로 연결하는 기본 플랫폼 제품군입니다.',
      accentLabel: 'Flagship',
    ),
    CorporateInfoCardData(
      title: 'Operations Hub',
      body: '운영 편의성과 관리 효율을 강조하는 운영 중심 제품군입니다.',
      accentLabel: 'Operations',
    ),
    CorporateInfoCardData(
      title: 'Insight Analytics',
      body: '성과 지표와 의사결정 지원에 초점을 둔 분석 중심 제품군입니다.',
      accentLabel: 'Analytics',
    ),
  ];

  static const List<CorporateInfoCardData> valueCards = [
    CorporateInfoCardData(
      title: '도입 속도',
      body: '핵심 기능, 적용 대상, 기대 효과를 한 번에 이해할 수 있도록 메시지를 압축합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '운영 효율',
      body: '관리 부담을 줄이거나 반복 작업을 단순화하는 포인트를 전면에 배치합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '확장성',
      body: '기본 제품에서 확장 제품으로 자연스럽게 이어지는 구조를 제공합니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> metrics = [
    CorporateMetricData(value: '3', label: '대표 제품군'),
    CorporateMetricData(value: '1', label: '공통 제품 메시지'),
    CorporateMetricData(value: '24/7', label: '운영 대응 이미지'),
  ];
}

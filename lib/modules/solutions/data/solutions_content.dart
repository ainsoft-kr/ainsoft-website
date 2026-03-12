import '/modules/home/models/corporate_content_models.dart';

class SolutionsContent {
  SolutionsContent._();

  static const List<CorporateInfoCardData> solutionCards = [
    CorporateInfoCardData(
      title: 'B2B 소개형',
      body: '회사와 제품을 명확하게 소개해야 하는 기업용 홈페이지 구조에 적합합니다.',
      accentLabel: 'Corporate',
    ),
    CorporateInfoCardData(
      title: '제품 홍보형',
      body: '제품 라인업과 핵심 기능을 빠르게 보여주는 제품 중심 웹 구조에 적합합니다.',
      accentLabel: 'Product-led',
    ),
    CorporateInfoCardData(
      title: '리드 수집형',
      body: '홈페이지가 실제 문의와 영업 퍼널의 시작점이 되어야 하는 구조에 적합합니다.',
      accentLabel: 'Lead-gen',
    ),
  ];

  static const List<CorporateInfoCardData> approachCards = [
    CorporateInfoCardData(
      title: '문제 정의',
      body: '산업별로 반복되는 운영 문제를 먼저 정리해 고객이 자기 상황으로 읽을 수 있게 합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '구성 제안',
      body: '어떤 제품과 기능 조합이 필요한지 구조적으로 연결해 설명합니다.',
      dark: true,
    ),
    CorporateInfoCardData(
      title: '기대 효과',
      body: '운영 시간 절감, 정확도 향상, 커뮤니케이션 개선 같은 결과 중심 메시지를 사용합니다.',
      dark: true,
    ),
  ];

  static const List<CorporateMetricData> deliveryMetrics = [
    CorporateMetricData(value: '01', label: '진단'),
    CorporateMetricData(value: '02', label: '구성'),
    CorporateMetricData(value: '03', label: '안착'),
  ];
}

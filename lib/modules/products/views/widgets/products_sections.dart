import 'package:flutter/material.dart';
import '/core/routing/route_manager.dart';
import '/modules/products/controllers/products_view_model.dart';
import '/modules/home/models/corporate_content_models.dart';
import '/modules/home/widgets/corporate_page_components.dart';

class ProductsOverviewSection extends StatelessWidget {
  const ProductsOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return CorporatePageSection(
      label: 'Products',
      title: '제품 페이지는 기능 목록보다 도입 포인트가 먼저 보여야 합니다.',
      description:
          '방문자는 모든 기능을 읽지 않습니다. 제품이 어떤 문제를 해결하는지, 어떤 운영 이점을 만드는지, 누가 바로 이해할 수 있는지가 더 중요합니다.',
      child: _InfoCards(cards: controller.productCards),
    );
  }
}

class ProductsValueSection extends StatelessWidget {
  const ProductsValueSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return CorporatePageSection(
      label: 'Value',
      title: '제품 설명은 결국 고객 가치 중심으로 정리되어야 합니다.',
      description: '같은 기능도 어떤 맥락에서 설명하느냐에 따라 제품 이해 속도와 문의 전환율이 달라집니다.',
      dark: true,
      actionLabel: 'Solutions 보기',
      actionRoute: RouteManager.solutionsRoute,
      child: _InfoCards(cards: controller.valueCards),
    );
  }
}

class ProductsMetricsSection extends StatelessWidget {
  const ProductsMetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return CorporatePageSection(
      label: 'Product Metrics',
      title: '제품 페이지에 필요한 구조적 지표 예시입니다.',
      description:
          '실서비스 수치가 정리되면 이 자리에는 실제 고객 수, 적용 도메인, 기능 도입 범위를 연결할 수 있습니다.',
      child: _MetricCards(metrics: controller.metrics),
    );
  }
}

class ProductsActionSection extends StatelessWidget {
  const ProductsActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: '제품 페이지는 상세 소개이면서 동시에 영업 자료의 첫 화면 역할을 해야 합니다.',
      description: '문제 해결 시나리오까지 이어지면 제품 이해가 더 빨라집니다. 다음 단계는 솔루션 페이지 정리입니다.',
      primaryLabel: 'Solutions 보기',
      primaryRoute: RouteManager.solutionsRoute,
      secondaryLabel: '문의하기',
      secondaryRoute: RouteManager.contactRoute,
    );
  }
}

class _InfoCards extends StatelessWidget {
  const _InfoCards({required this.cards});

  final List<CorporateInfoCardData> cards;

  @override
  Widget build(BuildContext context) {
    return CorporateResponsiveWrap(
      children: [
        for (final card in cards)
          CorporateInfoCard(
            title: card.title,
            body: card.body,
            accentLabel: card.accentLabel,
            dark: card.dark,
          ),
      ],
    );
  }
}

class _MetricCards extends StatelessWidget {
  const _MetricCards({required this.metrics});

  final List<CorporateMetricData> metrics;

  @override
  Widget build(BuildContext context) {
    return CorporateResponsiveWrap(
      children: [
        for (final metric in metrics)
          CorporateMetricCard(
            value: metric.value,
            label: metric.label,
            dark: metric.dark,
          ),
      ],
    );
  }
}

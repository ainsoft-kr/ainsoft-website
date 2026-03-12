import 'package:flutter/material.dart';
import '/core/routing/route_manager.dart';
import '/modules/about/controllers/about_view_model.dart';
import '/modules/home/models/corporate_content_models.dart';
import '/modules/home/widgets/corporate_page_components.dart';

class AboutOverviewSection extends StatelessWidget {
  const AboutOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AboutViewModel();

    return CorporatePageSection(
      label: 'About',
      title: 'AINSOFT는 운영 자동화와 지식검색을 제품으로 만듭니다.',
      description:
          '복잡한 운영을 더 빠른 판단과 더 안전한 실행으로 바꾸기 위해 AISOpsFlow와 Ainsoft RAG를 설계했습니다. 제품의 구조만큼 실제 도입 가능성도 중요하게 생각합니다.',
      child: _InfoCards(cards: controller.overviewCards),
    );
  }
}

class AboutStrengthSection extends StatelessWidget {
  const AboutStrengthSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AboutViewModel();

    return CorporatePageSection(
      label: 'Core Strength',
      title: '현장에서 바로 쓸 수 있는 구조로 설계합니다.',
      description:
          '보안 경계를 고려한 실행 구조, 애플리케이션 안으로 들어가는 검색 구조, 그리고 빠른 도입을 위한 현실적인 제안 방식이 AINSOFT의 강점입니다.',
      dark: true,
      actionLabel: '문의하기',
      actionRoute: RouteManager.contactRoute,
      child: _InfoCards(cards: controller.strengthCards),
    );
  }
}

class AboutSnapshotSection extends StatelessWidget {
  const AboutSnapshotSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AboutViewModel();

    return CorporatePageSection(
      label: 'Snapshot',
      title: '핵심 방향은 단순하고 분명합니다.',
      description:
          '두 개의 제품, 하나의 운영 전략. 자동화와 지식검색을 함께 설계해 더 나은 운영 경험을 만드는 것이 AINSOFT가 지향하는 방향입니다.',
      child: _MetricCards(metrics: controller.snapshotMetrics),
    );
  }
}

class AboutActionSection extends StatelessWidget {
  const AboutActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: 'AINSOFT의 제품과 접근 방식을 더 자세히 확인해보세요.',
      description:
          'Products에서는 제품 구조를, Solutions에서는 실제 적용 장면을 확인할 수 있습니다. 도입 상담도 바로 이어서 진행할 수 있습니다.',
      primaryLabel: 'Products 보기',
      primaryRoute: RouteManager.productsRoute,
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

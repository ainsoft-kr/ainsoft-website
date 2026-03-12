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
      title: '회사 소개는 신뢰와 방향성을 동시에 전달해야 합니다.',
      description:
          '기업 방문자가 가장 먼저 확인하는 것은 무엇을 만드는지보다 어떤 회사인지입니다. 핵심 가치, 구축 경험, 운영 방식이 짧고 선명하게 보여야 합니다.',
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
      title: '소개 페이지에서 바로 보여줘야 하는 핵심 역량입니다.',
      description: '회사 소개는 추상적인 문장보다 실제로 어떤 점이 강한지 구조적으로 보이는 편이 낫습니다.',
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
      title: '간단한 수치 정보도 신뢰 형성에 도움이 됩니다.',
      description: '정확한 운영 수치가 아직 없어도, 구조적으로 어떤 메시지를 둘지 먼저 정리해두는 것이 중요합니다.',
      child: _MetricCards(metrics: controller.snapshotMetrics),
    );
  }
}

class AboutActionSection extends StatelessWidget {
  const AboutActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: 'About 페이지는 회사 설명이 아니라 신뢰를 설계하는 페이지입니다.',
      description:
          '회사 정체성과 도입 신뢰를 더 구체적으로 정리하려면 제품 구조와 솔루션 페이지까지 함께 이어서 설계해야 합니다.',
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

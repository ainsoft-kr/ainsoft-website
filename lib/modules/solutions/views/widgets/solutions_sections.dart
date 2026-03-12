import 'package:flutter/material.dart';
import '/core/routing/route_manager.dart';
import '/modules/solutions/controllers/solutions_view_model.dart';
import '/modules/home/models/corporate_content_models.dart';
import '/modules/home/widgets/corporate_page_components.dart';

class SolutionsOverviewSection extends StatelessWidget {
  const SolutionsOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SolutionsViewModel();

    return CorporatePageSection(
      label: 'Solutions',
      title: '솔루션 페이지는 기능 설명보다 해결 흐름을 먼저 보여줍니다.',
      description:
          '고객은 기능 자체보다 우리 상황에 맞는지부터 판단합니다. 산업, 업무, 운영 문제를 기준으로 제품 조합과 기대 효과를 설명하는 구조가 적합합니다.',
      child: _InfoCards(cards: controller.solutionCards),
    );
  }
}

class SolutionsApproachSection extends StatelessWidget {
  const SolutionsApproachSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SolutionsViewModel();

    return CorporatePageSection(
      label: 'Approach',
      title: '솔루션 설명은 고객 문제와 적용 결과를 연결해야 합니다.',
      description: '업무 문제, 적용 방식, 기대 효과의 흐름이 끊기지 않도록 페이지를 설계하면 이해 속도가 빨라집니다.',
      dark: true,
      actionLabel: '문의하기',
      actionRoute: RouteManager.contactRoute,
      child: _InfoCards(cards: controller.approachCards),
    );
  }
}

class SolutionsDeliverySection extends StatelessWidget {
  const SolutionsDeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SolutionsViewModel();

    return CorporatePageSection(
      label: 'Delivery',
      title: '실행 구조도 함께 보이면 솔루션 설득력이 높아집니다.',
      description:
          '프로젝트 착수, 기능 적용, 운영 안착까지의 흐름을 함께 보여주면 방문자가 도입 장벽을 더 낮게 느낍니다.',
      child: _MetricCards(metrics: controller.deliveryMetrics),
    );
  }
}

class SolutionsActionSection extends StatelessWidget {
  const SolutionsActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: 'Solutions 페이지는 방문자가 “우리 회사에도 적용되겠다”라고 느끼게 만드는 화면입니다.',
      description:
          '마지막 전환 단계는 문의 페이지입니다. 연락 방법과 상담 진입점을 단순하게 보여주는 구조로 연결하면 됩니다.',
      primaryLabel: 'Contact 보기',
      primaryRoute: RouteManager.contactRoute,
      secondaryLabel: 'About 보기',
      secondaryRoute: RouteManager.aboutRoute,
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

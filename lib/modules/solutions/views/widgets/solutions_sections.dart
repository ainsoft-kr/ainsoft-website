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
      title: '운영팀, 서비스데스크, 규제 환경까지 바로 적용할 수 있습니다.',
      description:
          '운영 이벤트 대응, 티켓 처리, 내부 지식검색, 승인 절차를 각 조직의 현실에 맞게 연결해 더 빠르고 일관된 운영 흐름을 만듭니다.',
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
      title: '현장의 흐름에 맞춰 자동화와 검색을 연결합니다.',
      description:
          '반복 업무는 자동화하고, 판단이 필요한 지점에는 필요한 문서와 근거를 즉시 제공해 팀의 대응 속도와 품질을 함께 높입니다.',
      dark: true,
      actionLabel: '문의하기',
      actionRoute: RouteManager.contactRoute,
      child: _InfoCards(cards: controller.approachCards),
    );
  }
}

class SolutionsAisopsflowSection extends StatelessWidget {
  const SolutionsAisopsflowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SolutionsViewModel();

    return CorporatePageSection(
      label: 'Job Roles',
      title: '업무 역할에 따라 필요한 흐름을 다르게 설계합니다.',
      description:
          '운영담당자, 헬프데스크, 보안담당자마다 필요한 승인 절차와 검색 정보가 다르기 때문에 역할에 맞는 경험으로 풀어내는 것이 중요합니다.',
      child: _InfoCards(cards: controller.aisopsflowCards),
    );
  }
}

class SolutionsRagSection extends StatelessWidget {
  const SolutionsRagSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SolutionsViewModel();

    return CorporatePageSection(
      label: 'Use Cases',
      title: '자주 쓰이는 적용 장면을 중심으로 바로 연결합니다.',
      description:
          '장애 대응, 내부 지식검색, 채널 연계 자동화처럼 운영팀이 자주 마주치는 순간에 맞춘 시나리오로 구성했습니다.',
      dark: true,
      child: _InfoCards(cards: controller.ragCards),
    );
  }
}

class SolutionsCombinedSection extends StatelessWidget {
  const SolutionsCombinedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SolutionsViewModel();

    return CorporatePageSection(
      label: 'Combined Solutions',
      title: '두 제품을 함께 쓰면 운영 전 과정이 더 매끄러워집니다.',
      description:
          '이벤트 감지부터 승인, 실행, 보고, 그리고 문서 기반 판단까지 하나의 흐름으로 이어져 팀 전체의 운영 경험을 바꿉니다.',
      child: _InfoCards(cards: controller.combinedCards),
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
      title: '이런 환경에서 빠르게 효과를 만듭니다.',
      description:
          'IT 운영, 헬프데스크, 온프레미스, 내부 포털처럼 도입 맥락이 분명한 환경일수록 더 빠르게 가치를 확인할 수 있습니다.',
      child: _MetricCards(metrics: controller.deliveryMetrics),
    );
  }
}

class SolutionsActionSection extends StatelessWidget {
  const SolutionsActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: '운영 자동화와 지식검색을 한 번에 설계해보세요.',
      description:
          '조직의 운영 방식에 맞춰 AISOpsFlow와 Ainsoft RAG를 조합하면 더 빠른 대응과 더 나은 근거 기반 운영을 만들 수 있습니다.',
      primaryLabel: 'Contact 보기',
      primaryRoute: RouteManager.contactRoute,
      secondaryLabel: 'Products 보기',
      secondaryRoute: RouteManager.productsRoute,
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

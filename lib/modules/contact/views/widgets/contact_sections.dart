import 'package:flutter/material.dart';
import '/core/routing/route_manager.dart';
import '/modules/contact/controllers/contact_view_model.dart';
import '/modules/home/models/corporate_content_models.dart';
import '/modules/home/widgets/corporate_page_components.dart';

class ContactOverviewSection extends StatelessWidget {
  const ContactOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ContactViewModel();

    return CorporatePageSection(
      label: 'Contact',
      title: '도입 상담, PoC, 협업 제안을 바로 시작할 수 있습니다.',
      description:
          '운영 자동화, 지식검색, 또는 두 제품의 조합이 필요한 경우 현재 상황과 목표를 기준으로 가장 적합한 방향을 함께 정리합니다.',
      child: _InfoCards(cards: controller.contactCards),
    );
  }
}

class ContactChannelsSection extends StatelessWidget {
  const ContactChannelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ContactViewModel();

    return CorporatePageSection(
      label: 'Channels',
      title: '이런 주제로 상담을 많이 시작합니다.',
      description:
          '운영 자동화, 지식검색, 통합 시나리오 중 어디에서부터 시작할지 정하면 더 빠르게 필요한 제품과 구조를 제안할 수 있습니다.',
      dark: true,
      actionLabel: 'About 보기',
      actionRoute: RouteManager.aboutRoute,
      child: _InfoCards(cards: controller.channelCards),
    );
  }
}

class ContactChecklistSection extends StatelessWidget {
  const ContactChecklistSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ContactViewModel();

    return CorporatePageSection(
      label: 'Checklist',
      title: '이 세 가지만 정리되면 상담이 더 빨라집니다.',
      description:
          '적용하려는 업무 흐름, 현재 운영 환경, 희망 일정을 알려주시면 제품 구성과 도입 방향을 더 구체적으로 제안할 수 있습니다.',
      child: _MetricCards(metrics: controller.checklistMetrics),
    );
  }
}

class ContactActionSection extends StatelessWidget {
  const ContactActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: 'AINSOFT와 함께 운영 자동화와 지식검색 전략을 설계해보세요.',
      description:
          '제품 소개부터 PoC 방향, 통합 시나리오까지 현재 환경에 맞는 현실적인 도입 방안을 함께 제안합니다.',
      primaryLabel: '홈으로 이동',
      primaryRoute: RouteManager.initialRoute,
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

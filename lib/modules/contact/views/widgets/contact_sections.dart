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
      title: '문의 페이지는 길지 않아야 하고, 바로 행동할 수 있어야 합니다.',
      description: '대표 연락처, 상담 요청 방식, 기대 응답 흐름을 짧고 분명하게 보여주면 전환 손실을 줄일 수 있습니다.',
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
      title: '연락 수단은 많기보다 명확한 것이 중요합니다.',
      description: '의사결정권자가 바로 행동할 수 있도록 핵심 채널과 필요한 준비 정보를 함께 배치합니다.',
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
      title: '문의 전에 준비하면 좋은 정보 예시입니다.',
      description: '산업군, 필요한 기능, 예상 일정 정도만 받아도 상담 품질이 크게 올라갑니다.',
      child: _MetricCards(metrics: controller.checklistMetrics),
    );
  }
}

class ContactActionSection extends StatelessWidget {
  const ContactActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: '문의 페이지의 목적은 설명이 아니라 상담 시작입니다.',
      description: '현재 구조에서는 모든 상위 페이지가 이 문의 페이지로 자연스럽게 연결되도록 정리되어 있습니다.',
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

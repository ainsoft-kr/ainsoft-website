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
      title: 'AISOpsFlow와 Ainsoft RAG, 서로 다른 역할의 두 제품 라인업.',
      description:
          '운영 자동화 플랫폼과 내장형 RAG 엔진 제품군. AINSOFT는 실행 자동화와 지식검색이라는 두 축을 각기 다른 제품으로 제공합니다.',
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
      title: '실행 시스템과 검색 시스템, 각자의 역할에 맞게 설계했습니다.',
      description:
          'AISOpsFlow는 하이브리드 실행 구조와 플러그인 확장성으로, Ainsoft RAG는 엔진과 검색 파이프라인, Spring Boot starter 구성으로 차별화됩니다.',
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
      title: '핵심 구조를 한눈에 보여주는 제품 축.',
      description:
          '제품의 중심이 되는 구조와 통합 포인트를 짧고 선명하게 정리했습니다. 각 제품의 성격이 다르다는 점이 바로 드러납니다.',
      child: _MetricCards(metrics: controller.metrics),
    );
  }
}

class ProductsAisopsflowSection extends StatelessWidget {
  const ProductsAisopsflowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return CorporatePageSection(
      label: 'AISOpsFlow',
      title: '보안 경계를 유지한 채 운영 자동화를 실행합니다.',
      description:
          '클라우드 Core와 온프레미스 Runner를 분리해 두고, 승인과 실행, 보고까지 이어지는 워크플로우를 안정적으로 운영할 수 있습니다.',
      child: _InfoCards(cards: controller.aisopsflowCards),
    );
  }
}

class ProductsRagSection extends StatelessWidget {
  const ProductsRagSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return CorporatePageSection(
      label: 'Ainsoft RAG',
      title: '서비스 안에 바로 넣을 수 있는 내장형 RAG 엔진 제품군.',
      description:
          '검색 엔진, 파이프라인 모듈, starter 제품군을 통해 운영 포털과 업무 시스템 안에 지식검색 경험을 자연스럽게 녹여낼 수 있습니다.',
      dark: true,
      child: _InfoCards(cards: controller.ragCards),
    );
  }
}

class ProductsFitSection extends StatelessWidget {
  const ProductsFitSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return CorporatePageSection(
      label: 'Product Fit',
      title: '단독으로도 강하고, 함께 쓰면 더 선명합니다.',
      description:
          'AISOpsFlow는 실행 자동화를, Ainsoft RAG는 지식검색을 담당합니다. 역할이 분리되어 있기 때문에 더 유연하게 조합할 수 있습니다.',
      child: _InfoCards(cards: controller.productFitCards),
    );
  }
}

class ProductsOpenSourceSection extends StatelessWidget {
  const ProductsOpenSourceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return CorporatePageSection(
      label: 'Open Source',
      title: '오픈소스 자산도 함께 공개합니다.',
      description:
          'Ainsoft RAG는 Spring Boot starter 계열 저장소를, AISOpsFlow는 plugin SDK 와 catalog 저장소를 공개하고 있습니다. 확장 포인트와 통합 자산을 직접 확인할 수 있습니다.',
      child: _InfoCards(cards: controller.openSourceCards),
    );
  }
}

class ProductsActionSection extends StatelessWidget {
  const ProductsActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: '도입 환경에 맞는 제품 구성을 설계해보세요.',
      description:
          '운영 자동화가 필요한지, 지식검색이 필요한지, 혹은 두 제품의 조합이 필요한지에 따라 가장 적합한 구성을 제안합니다.',
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

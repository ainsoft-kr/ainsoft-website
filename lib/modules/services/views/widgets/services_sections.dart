import 'package:flutter/material.dart';

import '/core/routing/route_manager.dart';
import '/modules/home/models/corporate_content_models.dart';
import '/modules/home/widgets/corporate_page_components.dart';
import '/modules/services/controllers/services_view_model.dart';

class ServicesOverviewSection extends StatelessWidget {
  const ServicesOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return CorporatePageSection(
      label: 'Services',
      title: 'InternVL 기반 멀티모달 AI 서비스로 제조 현장을 더 정밀하게 해석합니다.',
      description:
          '이미지, 영상, 문서, 표, 리포트를 함께 이해하는 멀티모달 구조를 바탕으로 생산공정 분석, 안전관제, 기술 문서 질의응답, 검사 자동화 같은 서비스를 설계할 수 있습니다.',
      child: _InfoCards(cards: controller.overviewCards),
    );
  }
}

class ServicesInternvlSection extends StatelessWidget {
  const ServicesInternvlSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return CorporatePageSection(
      label: 'InternVL',
      title: '문서 이해와 현장 시각지능이 강한 오픈소스 멀티모달 기반을 사용합니다.',
      description:
          'InternVL은 OCR, 문서 질의응답, 차트 해석, 이미지·영상 이해에 강점을 가진 오픈소스 계열입니다. 이를 기반으로 현장 서비스에 맞는 분석, 검색, 자동화 계층을 결합할 수 있습니다.',
      dark: true,
      child: _InfoCards(cards: controller.internvlCards),
    );
  }
}

class ServicesReadySection extends StatelessWidget {
  const ServicesReadySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return CorporatePageSection(
      label: 'Ready Services',
      title: '다음 영역은 InternVL 기반으로 바로 서비스 설계를 시작할 수 있습니다.',
      description:
          '이미지·영상·문서 해석이 핵심인 과제는 멀티모달 서비스로 빠르게 PoC를 시작할 수 있습니다. 필요하면 Ainsoft RAG, AISOpsFlow와 결합해 검색과 실행까지 연결합니다.',
      child: _InfoCards(cards: controller.readyServiceCards),
    );
  }
}

class ServicesLlmSection extends StatelessWidget {
  const ServicesLlmSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return CorporatePageSection(
      label: 'LLM Build Services',
      title: '오픈소스 기반 LLM 구축 서비스도 함께 제공합니다.',
      description:
          '로컬 PoC부터 고성능 API 서빙, 온프레미스 배포, 엣지 추론까지 환경에 맞는 오픈소스 스택을 조합해 LLM 서비스를 구축할 수 있습니다.',
      child: _InfoCards(cards: controller.llmServiceCards),
    );
  }
}

class ServicesExtendedSection extends StatelessWidget {
  const ServicesExtendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return CorporatePageSection(
      label: 'Extended Services',
      title: '다음 영역은 센서, 분석 엔진, 제어 시스템을 함께 결합해야 합니다.',
      description:
          '도막 측정, 열 제어, 시계열 분석, 음성 위험 감지, 3D·AR 계열 과제는 InternVL 단독보다 복합 아키텍처가 필요합니다. 멀티모달 모델은 그 안에서 해석과 설명, 화면 인식, 질의응답을 담당하는 것이 현실적입니다.',
      dark: true,
      child: _InfoCards(cards: controller.extendedServiceCards),
    );
  }
}

class ServicesLlmStackSection extends StatelessWidget {
  const ServicesLlmStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return CorporatePageSection(
      label: 'LLM Architecture',
      title: 'RAG, 멀티모달, 자동화를 연결한 실제 서비스 구조로 확장할 수 있습니다.',
      description:
          '단순 모델 실행을 넘어 문서 검색, 멀티모달 이해, 실행 자동화까지 이어지는 서비스 아키텍처를 설계할 수 있습니다.',
      dark: true,
      child: _InfoCards(cards: controller.llmStackCards),
    );
  }
}

class ServicesMetricsSection extends StatelessWidget {
  const ServicesMetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return CorporatePageSection(
      label: 'Model Snapshot',
      title: 'InternVL 공식 공개 자료에서 확인되는 멀티모달 강점입니다.',
      description:
          '문서 이해, 차트 해석, OCR, 이미지·영상 입력 지원은 제조 현장 서비스로 연결하기 좋은 기반입니다. 실제 서비스에서는 도메인 데이터와 업무 흐름에 맞춘 추가 설계가 함께 필요합니다.',
      child: _MetricCards(metrics: controller.internvlMetrics),
    );
  }
}

class ServicesLlmMetricsSection extends StatelessWidget {
  const ServicesLlmMetricsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return CorporatePageSection(
      label: 'LLM Stack',
      title: '구축 목적에 따라 오픈소스 스택을 다르게 조합합니다.',
      description:
          '빠른 실험, 고성능 서빙, 경량 모델 검토, 온프레미스 추론처럼 요구사항에 맞춰 Ollama, vLLM, BitNet, llama.cpp 조합을 제안합니다.',
      child: _MetricCards(metrics: controller.llmMetrics),
    );
  }
}

class ServicesActionSection extends StatelessWidget {
  const ServicesActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CorporateActionBanner(
      title: '멀티모달 AI 서비스가 필요한 현장을 함께 설계해보세요.',
      description:
          'InternVL 기반 시각·문서 이해, Ainsoft RAG 기반 지식검색, AISOpsFlow 기반 실행 자동화를 조합해 제조 현장 전반에 적용 가능한 현실적인 서비스 구조를 제안합니다.',
      primaryLabel: '문의하기',
      primaryRoute: RouteManager.contactRoute,
      secondaryLabel: 'Solutions 보기',
      secondaryRoute: RouteManager.solutionsRoute,
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

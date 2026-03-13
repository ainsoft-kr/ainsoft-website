import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/core/routing/route_manager.dart';
import '/modules/about/controllers/about_view_model.dart';
import '/modules/home/models/corporate_content_models.dart';
import '/modules/home/widgets/corporate_page_components.dart';
import '/modules/home/widgets/corporate_responsive.dart';
import '/shared/design/assets.dart';

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

class AboutFounderSection extends StatelessWidget {
  const AboutFounderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AboutViewModel();

    return CorporatePageSection(
      label: 'Founder',
      title: '대표 박영규는 제품 구조와 도입 현실을 함께 설계합니다.',
      description:
          'Google, 공공기관, 엔터프라이즈, 스타트업을 거치며 쌓은 경험을 바탕으로 AINSOFT의 제품 방향과 구현을 직접 이끌고 있습니다.',
      child: _FounderSectionContent(controller: controller),
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

class _FounderSectionContent extends StatelessWidget {
  const _FounderSectionContent({required this.controller});

  final AboutViewModel controller;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final useColumn = constraints.maxWidth < 880;
            final portrait = const _FounderPortraitCard();
            final details = _FounderBio(controller: controller);

            if (useColumn) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  portrait,
                  SizedBox(height: responsive.isMobile ? 20 : 24),
                  details,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 4, child: _FounderPortraitCard()),
                SizedBox(width: responsive.gap),
                Expanded(flex: 6, child: details),
              ],
            );
          },
        ),
        SizedBox(height: responsive.isMobile ? 20 : 28),
        _InfoCards(cards: controller.founderHighlightCards),
      ],
    );
  }
}

class _FounderPortraitCard extends StatelessWidget {
  const _FounderPortraitCard();

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Container(
      constraints: const BoxConstraints(maxWidth: 420),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsive.isMobile ? 24 : 32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F2A2B).withValues(alpha: 0.10),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(responsive.isMobile ? 24 : 32),
        child: AspectRatio(
          aspectRatio: 0.9,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(AssetsManager.founderPortraitPath, fit: BoxFit.cover),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color(0xFF0F2A2B).withValues(alpha: 0.05),
                      const Color(0xFF0F2A2B).withValues(alpha: 0.38),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: responsive.isMobile ? 18 : 24,
                right: responsive.isMobile ? 18 : 24,
                bottom: responsive.isMobile ? 18 : 24,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.isMobile ? 14 : 16,
                    vertical: responsive.isMobile ? 12 : 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.82),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Founder Portrait',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: responsive.isMobile ? 11 : 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                          color: const Color(0xFFC86E42),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'AINSOFT의 제품 방향과 구현을 함께 이끄는 대표',
                        style: GoogleFonts.dmSans(
                          fontSize: responsive.isMobile ? 13 : 14,
                          height: 1.5,
                          color: const Color(0xFF375455),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FounderBio extends StatelessWidget {
  const _FounderBio({required this.controller});

  final AboutViewModel controller;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.founderName,
          style: GoogleFonts.spaceGrotesk(
            fontSize: responsive.isMobile ? 32 : 40,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F2A2B),
            height: 1.05,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          controller.founderRole,
          style: GoogleFonts.dmSans(
            fontSize: responsive.isMobile ? 18 : 20,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFC86E42),
          ),
        ),
        const SizedBox(height: 16),
        _FounderMetaLine(text: controller.founderLocation),
        const SizedBox(height: 8),
        _FounderMetaLine(text: controller.founderEducation),
        SizedBox(height: responsive.isMobile ? 18 : 20),
        for (final paragraph in controller.founderIntroParagraphs) ...[
          Text(
            paragraph,
            style: GoogleFonts.dmSans(
              fontSize: responsive.bodyFontSize,
              height: 1.75,
              color: const Color(0xFF4C6767),
            ),
          ),
          const SizedBox(height: 14),
        ],
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final tag in controller.founderFocusTags)
              _FounderTag(label: tag),
          ],
        ),
      ],
    );
  }
}

class _FounderMetaLine extends StatelessWidget {
  const _FounderMetaLine({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 6),
          decoration: const BoxDecoration(
            color: Color(0xFFC86E42),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.dmSans(
              fontSize: 14,
              height: 1.6,
              color: Color(0xFF375455),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _FounderTag extends StatelessWidget {
  const _FounderTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E6D7),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: GoogleFonts.dmSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF0F2A2B),
        ),
      ),
    );
  }
}

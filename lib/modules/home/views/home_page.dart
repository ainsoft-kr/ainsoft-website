import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/core/routing/route_manager.dart';
import '../widgets/corporate_page_components.dart';
import '../widgets/corporate_responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _HomeHeroSection(),
        _HomeTrustStrip(),
        CorporatePageSection(
          label: 'About',
          title: '회사 소개와 신뢰의 이유를 짧고 분명하게 전달합니다.',
          description:
              '브랜드 신뢰, 구축 경험, 제품 이해도를 한 흐름으로 보여주는 B2B 기업 홈페이지 구조입니다.',
          actionLabel: 'About 보기',
          actionRoute: RouteManager.aboutRoute,
          child: CorporateResponsiveWrap(
            children: [
              CorporateInfoCard(
                title: '회사 소개',
                body: '회사 정체성과 제공 가치를 방문자가 빠르게 이해할 수 있도록 구성합니다.',
              ),
              CorporateInfoCard(
                title: '핵심 역량',
                body: '기술력, 구축 경험, 대응 속도 같은 핵심 강점을 명확하게 노출합니다.',
              ),
              CorporateInfoCard(
                title: '신뢰 요소',
                body: '연혁, 인증, 레퍼런스, 파트너십 등 신뢰 포인트를 체계적으로 보여줍니다.',
              ),
            ],
          ),
        ),
        CorporatePageSection(
          label: 'Products',
          title: '제품 설명은 간결하게, 도입 포인트는 명확하게 구성합니다.',
          description: '대표 제품군과 핵심 기능을 한눈에 정리해 방문자가 빠르게 이해할 수 있게 합니다.',
          dark: true,
          actionLabel: 'Products 보기',
          actionRoute: RouteManager.productsRoute,
          child: CorporateResponsiveWrap(
            children: [
              CorporateInfoCard(
                title: 'Platform',
                body: '대표 제품의 역할과 도입 포인트를 한 줄 메시지 중심으로 정리합니다.',
                dark: true,
              ),
              CorporateInfoCard(
                title: 'Operations',
                body: '운영 효율과 관리 편의성에 초점을 둔 제품 설명 구조를 제공합니다.',
                dark: true,
              ),
              CorporateInfoCard(
                title: 'Analytics',
                body: '성과와 지표 중심의 가치 전달이 가능하도록 제품 소개를 구성합니다.',
                dark: true,
              ),
            ],
          ),
        ),
        CorporatePageSection(
          label: 'Solutions',
          title: '기능보다 문제 해결 흐름이 먼저 보이도록 설계합니다.',
          description: '산업별·업무별 시나리오를 중심으로 제품이 어떤 효과를 만드는지 보여줍니다.',
          actionLabel: 'Solutions 보기',
          actionRoute: RouteManager.solutionsRoute,
          child: CorporateResponsiveWrap(
            children: [
              CorporateInfoCard(
                title: 'B2B 소개형',
                body: '회사와 제품을 명확하게 소개해야 하는 기업용 구조에 적합합니다.',
              ),
              CorporateInfoCard(
                title: '제품 홍보형',
                body: '제품 라인업과 핵심 기능을 빠르게 보여주는 제품 중심 페이지에 적합합니다.',
              ),
              CorporateInfoCard(
                title: '리드 수집형',
                body: '홈페이지가 실제 문의와 영업 퍼널 역할을 해야 하는 구조에 적합합니다.',
              ),
            ],
          ),
        ),
        CorporateActionBanner(
          title:
              '회사 소개, 제품 소개, 솔루션 설명, 문의 전환까지 한 구조로 정리된 웹 홈페이지를 바로 시작할 수 있습니다.',
          description: '상세 페이지 구조를 미리 분리해두면 콘텐츠 확장과 운영이 훨씬 단순해집니다.',
          primaryLabel: '문의 페이지로 이동',
          primaryRoute: RouteManager.contactRoute,
          secondaryLabel: 'Products 보기',
          secondaryRoute: RouteManager.productsRoute,
        ),
      ],
    );
  }
}

class _HomeHeroSection extends StatelessWidget {
  const _HomeHeroSection();

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Padding(
      padding: responsive.sectionPadding.copyWith(
        top: responsive.isMobile ? 2 : 4,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Container(
            padding: EdgeInsets.all(
              responsive.isMobile
                  ? 20
                  : responsive.isTablet
                  ? 26
                  : 32,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF0F2A2B),
              borderRadius: BorderRadius.circular(
                responsive.isMobile ? 26 : 36,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x220F2A2B),
                  blurRadius: 30,
                  offset: Offset(0, 18),
                ),
              ],
            ),
            child: responsive.isBrowser
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(flex: 7, child: _HomeHeroCopy()),
                      SizedBox(width: 24),
                      Expanded(flex: 5, child: _HomeHeroPanels()),
                    ],
                  )
                : const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HomeHeroCopy(),
                      SizedBox(height: 16),
                      _HomeHeroPanels(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _HomeHeroCopy extends StatelessWidget {
  const _HomeHeroCopy();

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFC86E42),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'Corporate Website Experience',
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: responsive.isMobile ? 12 : 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '제품 소개와 문의 전환이 동시에 되는 회사 홈페이지.',
          style: GoogleFonts.spaceGrotesk(
            fontSize: responsive.heroTitleSize,
            height: 1.02,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFF7F2EA),
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.isBrowser ? 620 : double.infinity,
          ),
          child: Text(
            '회사 소개, 제품 개요, 솔루션 가치, 문의 CTA를 각 모듈로 분리해 방문자가 빠르게 이해하고 필요한 페이지로 바로 이동할 수 있게 구성합니다.',
            style: GoogleFonts.dmSans(
              fontSize: responsive.isMobile ? 16 : 18,
              height: 1.7,
              color: const Color(0xFFD7E2DC),
            ),
          ),
        ),
        const SizedBox(height: 28),
        responsive.isMobile
            ? const _HeroButtonColumn()
            : const _HeroButtonWrap(),
      ],
    );
  }
}

class _HeroButtonColumn extends StatelessWidget {
  const _HeroButtonColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton(
          onPressed: RouteManager.toProducts,
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFC86E42),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
          child: const Text('제품 보기'),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: RouteManager.toContact,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFF7F2EA),
            side: const BorderSide(color: Color(0xFFBBD0C6)),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
          child: const Text('상담 문의'),
        ),
      ],
    );
  }
}

class _HeroButtonWrap extends StatelessWidget {
  const _HeroButtonWrap();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: [
        FilledButton(
          onPressed: RouteManager.toProducts,
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFC86E42),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
          child: const Text('제품 보기'),
        ),
        OutlinedButton(
          onPressed: RouteManager.toContact,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFF7F2EA),
            side: const BorderSide(color: Color(0xFFBBD0C6)),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
          child: const Text('상담 문의'),
        ),
      ],
    );
  }
}

class _HomeHeroPanels extends StatelessWidget {
  const _HomeHeroPanels();

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Column(
      children: [
        const CorporateInfoCard(
          title: '핵심 구성',
          body:
              '회사 소개와 제품 설명을 분리된 정보 구조로 구성하고, 모든 핵심 페이지에서 문의 CTA를 일관되게 노출합니다.',
          accentLabel: 'Structure',
        ),
        SizedBox(height: responsive.gap),
        const _HomeStatPanel(),
      ],
    );
  }
}

class _HomeStatPanel extends StatelessWidget {
  const _HomeStatPanel();

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Container(
      padding: EdgeInsets.all(responsive.isMobile ? 16 : 22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(responsive.isMobile ? 20 : 28),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: const CorporateResponsiveWrap(
        children: [
          CorporateMetricCard(
            value: '4',
            label: 'Independent pages',
            dark: true,
          ),
          CorporateMetricCard(
            value: '1',
            label: 'Shared nav system',
            dark: true,
          ),
          CorporateMetricCard(
            value: '1',
            label: 'Primary CTA flow',
            dark: true,
          ),
        ],
      ),
    );
  }
}

class _HomeTrustStrip extends StatelessWidget {
  const _HomeTrustStrip();

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Padding(
      padding: responsive.sectionPadding.copyWith(top: 0),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
          child: Wrap(
            spacing: responsive.gap,
            runSpacing: responsive.gap,
            children: const [
              _HomeTrustChip(label: '기업형 구조'),
              _HomeTrustChip(label: '반응형 웹'),
              _HomeTrustChip(label: '제품 중심'),
              _HomeTrustChip(label: '문의 전환 설계'),
              _HomeTrustChip(label: 'Flutter Web'),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeTrustChip extends StatelessWidget {
  const _HomeTrustChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.isMobile ? 14 : 16,
        vertical: responsive.isMobile ? 10 : 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: GoogleFonts.dmSans(
          fontSize: responsive.isMobile ? 13 : 14,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF224142),
        ),
      ),
    );
  }
}

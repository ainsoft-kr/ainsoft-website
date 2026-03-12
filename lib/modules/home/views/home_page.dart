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
          label: 'Positioning',
          title: '복잡한 운영을 자동화와 지식으로 더 단순하게 만듭니다.',
          description:
              'AISOpsFlow는 운영 이벤트를 실행 가능한 워크플로우로 바꾸고, Ainsoft RAG는 문서와 정책을 검색 가능한 지식 레이어로 만듭니다. AINSOFT는 두 제품을 통해 운영팀이 더 빠르게 판단하고 더 안전하게 실행하도록 돕습니다.',
          actionLabel: 'About 보기',
          actionRoute: RouteManager.aboutRoute,
          child: CorporateResponsiveWrap(
            children: [
              CorporateInfoCard(
                title: '운영 자동화 축',
                body: 'AISOpsFlow는 alerts, approval, actions, reporting을 하나의 흐름으로 연결해 반복적인 운영 절차를 표준화합니다.',
              ),
              CorporateInfoCard(
                title: '지식검색 축',
                body: 'Ainsoft RAG는 서비스 안에 직접 넣을 수 있는 Lucene 기반 임베디드 RAG 엔진으로 운영 문서와 정책을 빠르게 찾게 합니다.',
              ),
              CorporateInfoCard(
                title: '통합 운영 경험',
                body: '실행은 AISOpsFlow가 맡고, 검색과 근거 제공은 Ainsoft RAG가 맡아 운영팀이 하나의 흐름 안에서 대응할 수 있습니다.',
              ),
            ],
          ),
        ),
        CorporatePageSection(
          label: 'Products',
          title: 'AISOpsFlow와 Ainsoft RAG, 서로 다른 역할의 두 제품 라인업.',
          description:
              'AISOpsFlow는 하이브리드 실행 구조와 플러그인 확장성으로, Ainsoft RAG는 임베디드 검색 엔진과 Spring Boot starter 구성으로 설계되었습니다.',
          dark: true,
          actionLabel: 'Products 보기',
          actionRoute: RouteManager.productsRoute,
          child: CorporateResponsiveWrap(
            children: [
              CorporateInfoCard(
                title: 'AISOpsFlow',
                body: '운영 이벤트 이후 승인, 실행, 보고를 실제 워크플로우로 연결하는 운영 자동화 플랫폼입니다.',
                accentLabel: 'Ops Automation',
                dark: true,
              ),
              CorporateInfoCard(
                title: 'Ainsoft RAG',
                body: '서비스 안에 직접 넣을 수 있는 Lucene 기반 임베디드 RAG 엔진과 starter 제품군입니다.',
                accentLabel: 'Knowledge Retrieval',
                dark: true,
              ),
              CorporateInfoCard(
                title: 'Together',
                body: '하나는 실행 자동화를, 다른 하나는 지식검색을 담당해 단독으로도 명확하고 함께 쓸 때 더 강한 운영 경험을 제공합니다.',
                accentLabel: 'Combined Value',
                dark: true,
              ),
            ],
          ),
        ),
        CorporatePageSection(
          label: 'Solutions',
          title: '현장의 운영 문제를 실제 흐름에 맞게 풀어냅니다.',
          description:
              '운영 이벤트 대응, 서비스데스크, 내부 지식검색, 온프레미스 환경까지 각 조직의 현실에 맞는 적용 시나리오를 제공합니다.',
          actionLabel: 'Solutions 보기',
          actionRoute: RouteManager.solutionsRoute,
          child: CorporateResponsiveWrap(
            children: [
              CorporateInfoCard(
                title: '운영 이벤트 대응 자동화',
                body: '이벤트 발생 이후 승인과 실행을 연결하고, 반복 대응을 표준 워크플로우로 운영합니다.',
              ),
              CorporateInfoCard(
                title: '지식 기반 운영 지원',
                body: '매뉴얼, 정책, 장애 이력을 검색 가능한 지식 계층으로 묶어 운영 판단 속도와 응답 품질을 높입니다.',
              ),
              CorporateInfoCard(
                title: '운영 코파일럿 구성',
                body: '자동화 실행과 검색 근거 제공을 하나의 흐름으로 묶어 더 빠르고 일관된 운영 경험을 만듭니다.',
              ),
            ],
          ),
        ),
        CorporateActionBanner(
          title:
              '운영 자동화와 지식검색을 하나의 전략으로 연결해보세요.',
          description:
              'AISOpsFlow와 Ainsoft RAG를 조합하면 운영팀의 실행 속도와 판단 품질을 동시에 높일 수 있습니다.',
          primaryLabel: '문의하기',
          primaryRoute: RouteManager.contactRoute,
          secondaryLabel: 'Solutions 보기',
          secondaryRoute: RouteManager.solutionsRoute,
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
            'AINSOFT PRODUCT SUITE',
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: responsive.isMobile ? 12 : 14,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '운영 자동화와 지식검색을 하나의 흐름으로 연결합니다.',
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
            'AISOpsFlow는 운영 이벤트를 실행 가능한 워크플로우로 바꾸고, Ainsoft RAG는 문서와 정책을 검색 가능한 지식 레이어로 만듭니다. 더 빠른 대응, 더 정확한 판단, 더 안전한 실행을 위해 설계된 AINSOFT의 제품 조합입니다.',
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
          child: const Text('Products 보기'),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: RouteManager.toSolutions,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFF7F2EA),
            side: const BorderSide(color: Color(0xFFBBD0C6)),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
          child: const Text('Solutions 보기'),
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
          child: const Text('Products 보기'),
        ),
        OutlinedButton(
          onPressed: RouteManager.toSolutions,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFF7F2EA),
            side: const BorderSide(color: Color(0xFFBBD0C6)),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          ),
          child: const Text('Solutions 보기'),
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
          title: 'Built for Real Operations',
          body:
              'AISOpsFlow는 실행을 자동화하고, Ainsoft RAG는 필요한 근거를 즉시 찾게 합니다. 두 제품은 운영 현장에서 바로 쓰일 수 있도록 설계되었습니다.',
          accentLabel: 'AINSOFT',
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
            value: '2',
            label: 'Core Products',
            dark: true,
          ),
          CorporateMetricCard(
            value: 'Ops + RAG',
            label: 'Integrated Experience',
            dark: true,
          ),
          CorporateMetricCard(
            value: 'Core ↔ Runner / RAG Engine',
            label: 'Key Architectures',
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
      padding: EdgeInsets.fromLTRB(
        responsive.sectionPadding.left,
        responsive.isMobile ? 14 : 20,
        responsive.sectionPadding.right,
        responsive.isMobile ? 14 : 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.isBrowser ? 980 : responsive.maxContentWidth,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.isMobile ? 14 : 20,
              vertical: responsive.isMobile ? 14 : 18,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F2EA),
              borderRadius: BorderRadius.circular(
                responsive.isMobile ? 24 : 32,
              ),
              border: Border.all(
                color: const Color(0xFF0F2A2B).withValues(alpha: 0.08),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x180F2A2B),
                  blurRadius: 28,
                  offset: Offset(0, 16),
                ),
              ],
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: responsive.gap,
              runSpacing: responsive.gap,
              children: const [
                _HomeTrustChip(label: 'AISOpsFlow'),
                _HomeTrustChip(label: 'Ainsoft RAG'),
                _HomeTrustChip(label: 'Ops Automation'),
                _HomeTrustChip(label: 'Embedded RAG'),
                _HomeTrustChip(label: 'Hybrid Secure Runtime'),
              ],
            ),
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
        color: Colors.white.withValues(alpha: 0.82),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: const Color(0xFF0F2A2B).withValues(alpha: 0.06),
        ),
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

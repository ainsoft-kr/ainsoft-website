import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/core/routing/route_manager.dart';
import '../models/corporate_content_models.dart';
import '../widgets/corporate_responsive.dart';
import '../widgets/site_components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _flowKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeHero(onShowFlow: () => scrollToKey(_flowKey)),
        const _HomeOfferSection(),
        _HomeFlowSection(key: _flowKey),
        const _HomeScenarioSection(),
        const _HomeTrustSection(),
        const SiteFinalCta(
          title: '우리 팀의 반복 업무부터 함께 정리해 보세요',
          subtitle: '현재 운영 흐름이나 현장 데이터를 들려주시면, 자동화와 AI가 들어갈 지점을 같이 찾아드립니다.',
        ),
      ],
    );
  }
}

class _HomeHero extends StatelessWidget {
  const _HomeHero({required this.onShowFlow});

  final VoidCallback onShowFlow;

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);
    final leadSize = responsive.isMobile ? 17.0 : 20.0;
    final strong = siteText(fontSize: leadSize, fontWeight: FontWeight.w700);

    return SiteBand(
      verticalPadding: responsive.isMobile
          ? 48
          : responsive.isTablet
          ? 80
          : 112,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '운영 자동화 제품 · 현장 맞춤 AI 구축',
            style: siteText(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SiteColors.muted,
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: Semantics(
              header: true,
              child: Text(
                // Explicit breaks keep "워크플로우" from splitting mid-word.
                responsive.isMobile
                    ? '운영팀이 반복하던 일을\nAI 워크플로우로\n바꿉니다.'
                    : '운영팀이 반복하던 일을\nAI 워크플로우로 바꿉니다.',
                style: siteText(
                  // 30 keeps the first line on one row down to 360px wide.
                  fontSize: responsive.isMobile ? 30 : responsive.heroTitleSize,
                  fontWeight: FontWeight.w800,
                  height: 1.18,
                  letterSpacing: -0.8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'AINSOFT는 '),
                  TextSpan(text: '운영 자동화 제품', style: strong),
                  const TextSpan(text: '(AISOpsFlow · Ainsoft RAG)과 현장에 맞춘 '),
                  TextSpan(text: 'AI 구축 서비스', style: strong),
                  const TextSpan(text: '를 제공합니다.'),
                ],
              ),
              style: siteText(
                fontSize: leadSize,
                height: 1.6,
                color: SiteColors.ink2,
              ),
            ),
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 24,
            runSpacing: 20,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SitePrimaryCta(fullWidth: responsive.isMobile),
              SiteArrowLink(label: '어떻게 동작하나요', onTap: onShowFlow),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeOfferSection extends StatelessWidget {
  const _HomeOfferSection();

  static const _product = SiteCardData(
    kind: '제품',
    title: '운영 자동화 플랫폼',
    body: '반복되는 대응 절차는 자동으로 실행하고, 필요한 판단 근거는 바로 찾아줍니다.',
    items: [
      ('AISOpsFlow', '알림 → 승인 → 실행 → 보고 자동화'),
      ('Ainsoft RAG', '매뉴얼 · 정책 · 장애 이력 검색'),
    ],
    note: '함께 쓸 때 가장 강력하고, 하나씩 도입할 수도 있습니다.',
    linkLabel: '제품 자세히 보기',
  );

  static const _service = SiteCardData(
    kind: '구축 서비스',
    title: '현장 맞춤 AI 구축',
    body: '이미지, 영상, 문서를 읽는 AI를 고객 현장과 데이터에 맞춰 설계하고 구축합니다.',
    items: [
      ('현장 시각 AI', '공정 이상 징후 · 안전관제 영상 분석'),
      ('문서 · 도면 AI', '기술 문서 · 검사 리포트 질의응답'),
    ],
    note: '외부 반출이 어려운 환경을 위한 사내 LLM 구축도 함께 합니다.',
    linkLabel: '구축 서비스 자세히 보기',
  );

  @override
  Widget build(BuildContext context) {
    return SiteBand(
      color: SiteColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: 'AINSOFT가 제공하는 두 가지',
            subtitle: '바로 도입하는 제품과, 우리 현장에 맞게 만드는 구축 서비스.',
          ),
          SiteColumns(
            columns: 2,
            gap: 20,
            stretch: true,
            children: [
              SiteOfferCard(data: _product, onLink: RouteManager.toProducts),
              SiteOfferCard(data: _service, onLink: RouteManager.toServices),
            ],
          ),
        ],
      ),
    );
  }
}

class _FlowStepData {
  const _FlowStepData(this.title, this.body, this.owner, {this.human = false});

  final String title;
  final String body;
  final String owner;
  final bool human;
}

class _HomeFlowSection extends StatelessWidget {
  const _HomeFlowSection({super.key});

  static const _steps = [
    _FlowStepData('감지', '장애 · 티켓 · 이벤트 알림 수신', 'AISOpsFlow'),
    _FlowStepData('근거 찾기', '관련 매뉴얼과 과거 처리 이력 자동 검색', 'Ainsoft RAG'),
    _FlowStepData('승인', '담당자는 확인하고 승인만', '사람', human: true),
    _FlowStepData('실행', '정해진 대응 절차를 자동 실행', 'AISOpsFlow'),
    _FlowStepData('보고', '처리 결과를 채널로 자동 공유', 'AISOpsFlow'),
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);
    final steps = [
      for (var i = 0; i < _steps.length; i++)
        _FlowStep(index: i + 1, data: _steps[i]),
    ];

    return SiteBand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '알림이 오면, 다음 일은 워크플로우가 합니다',
            subtitle: '운영팀은 반복 작업 대신 승인과 판단에만 집중합니다.',
          ),
          if (responsive.isBrowser)
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < steps.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    Expanded(child: steps[i]),
                  ],
                ],
              ),
            )
          else
            Column(
              children: [
                for (var i = 0; i < steps.length; i++) ...[
                  if (i > 0) const SizedBox(height: 10),
                  steps[i],
                ],
              ],
            ),
          const SizedBox(height: 24),
          SiteArrowLink(
            label: '개발자를 위한 제품 구조 보기',
            onTap: RouteManager.toProducts,
          ),
        ],
      ),
    );
  }
}

class _FlowStep extends StatelessWidget {
  const _FlowStep({required this.index, required this.data});

  final int index;
  final _FlowStepData data;

  @override
  Widget build(BuildContext context) {
    final human = data.human;
    final fg = human ? SiteColors.onInk : SiteColors.ink;
    final fgMuted = human ? SiteColors.onInkMuted : SiteColors.muted;

    return Semantics(
      label: '$index단계 ${data.title}: ${data.body}, 담당 ${data.owner}',
      excludeSemantics: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
        decoration: BoxDecoration(
          color: human ? SiteColors.ink : SiteColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: human ? SiteColors.ink : SiteColors.line),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              index.toString().padLeft(2, '0'),
              style: GoogleFonts.spaceGrotesk(fontSize: 13, color: fgMuted),
            ),
            const SizedBox(height: 6),
            Text(
              data.title,
              style: siteText(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: fg,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data.body,
              style: siteText(fontSize: 14, height: 1.5, color: fgMuted),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: human
                    ? Colors.white.withValues(alpha: 0.14)
                    : SiteColors.sand,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                data.owner,
                style: siteText(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: human ? SiteColors.onInk : SiteColors.ink2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeScenarioSection extends StatelessWidget {
  const _HomeScenarioSection();

  static const _scenarios = [
    SiteScenarioData(
      who: 'IT 운영 · 관제',
      kind: '제품',
      title: '새벽 장애 알림',
      before: '당직자가 매뉴얼을 찾고, 담당자에게 전화하고, 직접 조치',
      after: '근거와 조치안이 함께 도착하고, 승인 한 번으로 실행',
    ),
    SiteScenarioData(
      who: '제조 · 안전관제',
      kind: '구축 서비스',
      title: '매일 쌓이는 검사 이미지',
      before: '검사자가 이미지와 영상을 하나씩 눈으로 확인',
      after: 'AI가 이상 징후만 골라 근거와 함께 알림',
    ),
    SiteScenarioData(
      who: '규제 산업 · 온프레미스',
      kind: '제품 + 구축',
      title: '데이터를 밖으로 못 내보내는 환경',
      before: '보안 정책 때문에 자동화와 AI 도입을 미룸',
      after: '실행과 검색 모두 사내에서, 권한 통제 안에서',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SiteBand(
      color: SiteColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '이런 팀에서 달라집니다',
            subtitle: '도입 전과 후, 운영팀의 하루가 어떻게 바뀌는지.',
          ),
          SiteColumns(
            children: [
              for (final scenario in _scenarios)
                SiteScenarioItem(data: scenario),
            ],
          ),
          const SizedBox(height: 32),
          SiteArrowLink(label: '활용 사례 더 보기', onTap: RouteManager.toSolutions),
        ],
      ),
    );
  }
}

class _HomeTrustSection extends StatelessWidget {
  const _HomeTrustSection();

  @override
  Widget build(BuildContext context) {
    return const SiteBand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SiteSectionHeading(title: '도입이 부담스럽지 않도록'),
          SiteColumns(
            children: [
              SiteTextItem(
                title: '데이터는 사내에',
                body: '실행 엔진은 고객 환경 안에서 동작하고, 클라우드와는 암호화된 채널로만 연결됩니다.',
              ),
              SiteTextItem(
                title: '권한대로만 검색',
                body: '문서 검색은 접근 권한을 따라, 볼 수 있는 사람에게만 보입니다.',
              ),
              SiteTextItem(
                title: '쓰던 도구 그대로',
                body: 'Slack, 이메일, 카카오 등 기존 채널과 서비스에 붙여 씁니다.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

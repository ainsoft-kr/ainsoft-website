import 'package:flutter/material.dart';
import '/core/routing/route_manager.dart';
import '/modules/about/controllers/about_view_model.dart';
import '/modules/home/widgets/corporate_responsive.dart';
import '/modules/home/widgets/site_components.dart';
import '/shared/design/assets.dart';

class AboutHeroSection extends StatelessWidget {
  const AboutHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SitePageHero(
      eyebrow: '회사 소개',
      title: '운영 현장에서 바로 쓰는\nAI를 만듭니다.',
      lead:
          'AINSOFT는 운영 자동화 제품(AISOpsFlow · Ainsoft RAG)과 현장 맞춤 AI 구축 서비스를 제공합니다. 제품 설명보다 실제로 도입되어 쓰이는지를 더 중요하게 봅니다.',
      secondaryLabel: '제품 살펴보기',
      onSecondary: RouteManager.toProducts,
    );
  }
}

class AboutPrinciplesSection extends StatelessWidget {
  const AboutPrinciplesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AboutViewModel();

    return SiteBand(
      color: SiteColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(title: '이렇게 일합니다'),
          SiteColumns(
            children: [
              for (final (title, body) in controller.principles)
                SiteTextItem(title: title, body: body),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutFounderSection extends StatelessWidget {
  const AboutFounderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = CorporateResponsive.of(context);
    const portrait = _FounderPortrait();
    const bio = _FounderBio();

    return SiteBand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '만드는 사람',
            subtitle: '제품의 방향과 구현을 대표가 직접 이끕니다.',
          ),
          if (responsive.isMobile)
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 240, child: portrait),
                SizedBox(height: 28),
                bio,
              ],
            )
          else
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 280, child: portrait),
                SizedBox(width: 48),
                Expanded(child: bio),
              ],
            ),
        ],
      ),
    );
  }
}

class _FounderPortrait extends StatelessWidget {
  const _FounderPortrait();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Image.asset(
          AssetsManager.founderPortraitPath,
          fit: BoxFit.cover,
          semanticLabel: '대표 박영규',
        ),
      ),
    );
  }
}

class _FounderBio extends StatelessWidget {
  const _FounderBio();

  @override
  Widget build(BuildContext context) {
    final controller = AboutViewModel();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.founderName,
          style: siteText(fontSize: 28, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 4),
        Text(
          controller.founderRole,
          style: siteText(fontSize: 16, color: SiteColors.ink2),
        ),
        const SizedBox(height: 20),
        for (final paragraph in controller.founderIntroParagraphs) ...[
          Text(
            paragraph,
            style: siteText(fontSize: 16, height: 1.7, color: SiteColors.ink2),
          ),
          const SizedBox(height: 12),
        ],
        const SizedBox(height: 12),
        SiteColumns(
          columns: 2,
          gap: 28,
          children: [
            SiteTextItem(
              title: '주요 프로젝트',
              body: '',
              bullets: controller.founderCareer,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SiteTextItem(title: '기술', body: controller.founderStack),
                const SizedBox(height: 20),
                SiteTextItem(title: '학력', body: controller.founderEducation),
                const SizedBox(height: 20),
                SiteTextItem(title: '위치', body: controller.founderLocation),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

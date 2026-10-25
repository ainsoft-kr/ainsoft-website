import 'package:flutter/material.dart';
import '/core/routing/route_manager.dart';
import '/modules/home/widgets/site_components.dart';
import '/modules/solutions/controllers/solutions_view_model.dart';

class SolutionsHeroSection extends StatelessWidget {
  const SolutionsHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SitePageHero(
      eyebrow: '활용 사례',
      title: '이런 팀에서\n이렇게 달라집니다.',
      lead:
          '운영 · 관제, 서비스데스크, 규제 환경, 제조 현장까지. 조직과 담당자별로 도입 전과 후가 어떻게 다른지 정리했습니다.',
      secondaryLabel: '제품 살펴보기',
      onSecondary: RouteManager.toProducts,
    );
  }
}

class SolutionsTeamSection extends StatelessWidget {
  const SolutionsTeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SolutionsViewModel();

    return SiteBand(
      color: SiteColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '조직별로 달라지는 장면',
            subtitle: '각 장면 옆의 표시는 제품, 구축 서비스 중 무엇으로 해결하는지를 뜻합니다.',
          ),
          SiteColumns(
            gap: 36,
            children: [
              for (final scenario in controller.teamScenarios)
                SiteScenarioItem(data: scenario),
            ],
          ),
        ],
      ),
    );
  }
}

class SolutionsRoleSection extends StatelessWidget {
  const SolutionsRoleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SolutionsViewModel();

    return SiteBand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(title: '담당자의 하루는 이렇게 바뀝니다'),
          SiteColumns(
            children: [
              for (final (title, body) in controller.roles)
                SiteTextItem(title: title, body: body),
            ],
          ),
        ],
      ),
    );
  }
}

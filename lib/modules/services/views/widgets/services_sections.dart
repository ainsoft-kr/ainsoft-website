import 'package:flutter/material.dart';
import '/modules/home/widgets/site_components.dart';
import '/modules/services/controllers/services_view_model.dart';

class ServicesHeroSection extends StatelessWidget {
  const ServicesHeroSection({super.key, required this.onShowDeveloper});

  final VoidCallback onShowDeveloper;

  @override
  Widget build(BuildContext context) {
    return SitePageHero(
      eyebrow: 'AI 구축 서비스',
      title: '현장의 이미지, 영상, 문서를\n읽는 AI를 구축합니다.',
      lead:
          '공정 · 안전관제 · 기술 문서처럼 현장에 쌓이는 데이터에 맞춘 멀티모달 AI와, 데이터를 밖으로 내보내지 않는 사내 LLM을 고객 환경에 맞춰 설계하고 구축합니다.',
      secondaryLabel: '개발자 정보 바로 보기',
      onSecondary: onShowDeveloper,
    );
  }
}

class ServicesAreasSection extends StatelessWidget {
  const ServicesAreasSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return SiteBand(
      color: SiteColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '구축하는 AI 세 가지',
            subtitle: '보는 AI, 읽는 AI, 그리고 사내에서 돌아가는 LLM.',
          ),
          SiteColumns(
            gap: 20,
            stretch: true,
            children: [
              for (final area in controller.buildAreas)
                SiteOfferCard(data: area),
            ],
          ),
        ],
      ),
    );
  }
}

class ServicesExtendedSection extends StatelessWidget {
  const ServicesExtendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return SiteBand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '센서 · 제어 시스템과 함께 설계하는 영역',
            subtitle: 'AI만으로 풀기 어려운 과제는 기존 계측 · 제어 시스템과 결합해 설계합니다.',
          ),
          SiteColumns(
            columns: 2,
            children: [
              for (final (title, body) in controller.extendedAreas)
                SiteTextItem(title: title, body: body),
            ],
          ),
        ],
      ),
    );
  }
}

class ServicesDeveloperSection extends StatelessWidget {
  const ServicesDeveloperSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ServicesViewModel();

    return SiteBand(
      color: SiteColors.ink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '개발자를 위한 정보',
            subtitle: '사용하는 기반 모델과 서빙 스택, 그리고 참고할 수 있는 오픈소스 저장소입니다.',
            dark: true,
          ),
          SiteColumns(
            columns: 2,
            gap: 40,
            children: [
              SiteDeveloperColumn(
                title: '기반 모델 · InternVL',
                specs: controller.modelSpecs,
                repos: controller.modelRepos,
                reposLabel: '오픈소스 저장소',
              ),
              SiteDeveloperColumn(
                title: 'LLM 서빙 스택',
                specs: controller.stackSpecs,
                repos: controller.stackRepos,
                reposLabel: '오픈소스 저장소',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

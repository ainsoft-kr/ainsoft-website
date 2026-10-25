import 'package:flutter/material.dart';
import '/modules/home/widgets/site_components.dart';
import '/modules/products/controllers/products_view_model.dart';

class ProductsHeroSection extends StatelessWidget {
  const ProductsHeroSection({super.key, required this.onShowDeveloper});

  final VoidCallback onShowDeveloper;

  @override
  Widget build(BuildContext context) {
    return SitePageHero(
      eyebrow: '제품',
      title: '반복 대응은 자동으로,\n판단 근거는 바로 옆에.',
      lead:
          'AISOpsFlow는 알림 이후의 대응을 실행하고, Ainsoft RAG는 그 판단에 필요한 문서를 찾습니다. 함께 쓸 때 가장 강력하고, 하나씩 도입할 수도 있습니다.',
      secondaryLabel: '개발자 정보 바로 보기',
      onSecondary: onShowDeveloper,
    );
  }
}

class ProductsLineupSection extends StatelessWidget {
  const ProductsLineupSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return SiteBand(
      color: SiteColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '두 제품, 두 가지 역할',
            subtitle: '하나는 실행을, 하나는 근거를 맡습니다.',
          ),
          SiteColumns(
            columns: 2,
            gap: 20,
            stretch: true,
            children: [
              for (final card in controller.productCards)
                SiteOfferCard(data: card),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductsAdoptionSection extends StatelessWidget {
  const ProductsAdoptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return SiteBand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '필요한 것부터 시작하세요',
            subtitle: '하나만 먼저 도입하고 나중에 연결해도 됩니다.',
          ),
          SiteColumns(
            children: [
              for (final (title, body, tag) in controller.adoptionOptions)
                SiteTextItem(title: title, body: body, tag: tag),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductsDeveloperSection extends StatelessWidget {
  const ProductsDeveloperSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductsViewModel();

    return SiteBand(
      color: SiteColors.ink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SiteSectionHeading(
            title: '개발자를 위한 정보',
            subtitle: '제품 구조와 확장 방식, 그리고 직접 확인할 수 있는 공개 저장소입니다.',
            dark: true,
          ),
          SiteColumns(
            columns: 2,
            gap: 40,
            children: [
              SiteDeveloperColumn(
                title: 'AISOpsFlow',
                specs: controller.aisopsflowSpecs,
                repos: controller.aisopsflowRepos,
              ),
              SiteDeveloperColumn(
                title: 'Ainsoft RAG',
                specs: controller.ragSpecs,
                repos: controller.ragRepos,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '/modules/home/widgets/site_components.dart';
import 'widgets/about_sections.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AboutHeroSection(),
        AboutPrinciplesSection(),
        AboutFounderSection(),
        SiteFinalCta(
          title: 'AINSOFT와 함께 시작해 보세요',
          subtitle: '제품 도입, AI 구축, 협업 제안 모두 같은 창구에서 받습니다.',
        ),
      ],
    );
  }
}

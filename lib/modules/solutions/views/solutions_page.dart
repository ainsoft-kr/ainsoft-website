import 'package:flutter/material.dart';
import '/modules/home/widgets/site_components.dart';
import 'widgets/solutions_sections.dart';

class SolutionsPage extends StatelessWidget {
  const SolutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SolutionsHeroSection(),
        SolutionsTeamSection(),
        SolutionsRoleSection(),
        SiteFinalCta(
          title: '우리 팀은 어디서부터 바뀔 수 있을까요',
          subtitle: '지금 가장 반복되는 업무 하나를 알려주시면, 어떻게 달라질 수 있는지 함께 그려 드립니다.',
        ),
      ],
    );
  }
}

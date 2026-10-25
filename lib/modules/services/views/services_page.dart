import 'package:flutter/material.dart';
import '/modules/home/widgets/site_components.dart';
import 'widgets/services_sections.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final _developerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ServicesHeroSection(onShowDeveloper: () => scrollToKey(_developerKey)),
        const ServicesAreasSection(),
        const ServicesExtendedSection(),
        ServicesDeveloperSection(key: _developerKey),
        const SiteFinalCta(
          title: '현장 데이터부터 같이 보겠습니다',
          subtitle: '어떤 이미지, 영상, 문서가 쌓이고 있는지 알려주시면 적용할 수 있는 AI 구조를 제안해 드립니다.',
        ),
      ],
    );
  }
}

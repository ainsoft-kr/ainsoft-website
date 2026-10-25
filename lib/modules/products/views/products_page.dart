import 'package:flutter/material.dart';
import '/modules/home/widgets/site_components.dart';
import 'widgets/products_sections.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _developerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductsHeroSection(onShowDeveloper: () => scrollToKey(_developerKey)),
        const ProductsLineupSection(),
        const ProductsAdoptionSection(),
        ProductsDeveloperSection(key: _developerKey),
        const SiteFinalCta(
          title: '우리 팀에 맞는 구성을 같이 정해 보세요',
          subtitle: '운영 자동화가 먼저인지, 지식검색이 먼저인지, 둘 다인지 함께 판단해 드립니다.',
        ),
      ],
    );
  }
}

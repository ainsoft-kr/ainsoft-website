import 'package:flutter/material.dart';
import 'widgets/solutions_sections.dart';

class SolutionsPage extends StatelessWidget {
  const SolutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SolutionsOverviewSection(),
        SolutionsApproachSection(),
        SolutionsDeliverySection(),
        SolutionsActionSection(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'widgets/about_sections.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AboutOverviewSection(),
        AboutStrengthSection(),
        AboutSnapshotSection(),
        AboutActionSection(),
      ],
    );
  }
}

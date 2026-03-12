import 'package:flutter/material.dart';

import 'widgets/services_sections.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ServicesOverviewSection(),
        ServicesInternvlSection(),
        ServicesReadySection(),
        ServicesLlmSection(),
        ServicesExtendedSection(),
        ServicesLlmStackSection(),
        ServicesMetricsSection(),
        ServicesLlmMetricsSection(),
        ServicesActionSection(),
      ],
    );
  }
}

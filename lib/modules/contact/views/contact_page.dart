import 'package:flutter/material.dart';
import 'widgets/contact_sections.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ContactHeroSection(),
        ContactChecklistSection(),
        ContactTopicsSection(),
      ],
    );
  }
}

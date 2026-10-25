import 'package:flutter/material.dart';
import 'widgets/contact_form_section.dart';
import 'widgets/contact_sections.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ContactOverviewSection(),
        ContactChannelsSection(),
        ContactChecklistSection(),
        ContactFormSection(),
        ContactActionSection(),
      ],
    );
  }
}

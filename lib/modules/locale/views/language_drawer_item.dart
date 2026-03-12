import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/modules/locale/controllers/localization_view_model.dart';
import '/modules/locale/views/language_dialog.dart';

/// Language selector drawer item for the navigation menu.
///
/// Displays the current language and allows changing it via a dialog.
///
/// ## Usage:
/// ```dart
/// Drawer(
///   child: ListView(
///     children: [
///       LanguageDrawerItem(),
///     ],
///   ),
/// )
/// ```
class LanguageDrawerItem extends StatelessWidget {
  /// Creates a [LanguageDrawerItem].
  const LanguageDrawerItem({super.key});

  LocalizationViewModel get controller => Modular.get<LocalizationViewModel>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) => ListTile(
        leading: const Icon(Icons.language),
        title: Text(
          'Language',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        subtitle: Text(
          controller.language.name,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => _showLanguageDialog(context),
      ),
    );
  }

  /// Shows the language picker dialog.
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const LanguagePickerDialog(),
    );
  }
}

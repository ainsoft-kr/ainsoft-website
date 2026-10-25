import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/shared/shared.dart';
import '../../../core/routing/route_manager.dart';
import '/modules/locale/data/services/localization_service.dart';
import '/shared/presentation/custom/customs.dart';
import '../controllers/localization_view_model.dart';
import '../data/models/language_model.dart';

/// A dialog widget to allow the user to select a language from a dropdown list.
/// This dialog uses GetX's `LocalizationViewModel` to manage the selected language.
class LanguagePickerDialog extends StatelessWidget {
  const LanguagePickerDialog({super.key});

  LocalizationViewModel get controller => inject<LocalizationViewModel>();

  @override
  Widget build(BuildContext context) {
    // Define the border style for the dropdown field.
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: ColorManager.bodyColor, width: 0.6),
      borderRadius: BorderRadius.circular(8.0),
    );

    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button in the top-right corner.
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: _close,
                  child: const Icon(Icons.clear, color: ColorManager.titleColor),
                ),
              ],
            ),
            // Title text for the language picker.
            const CustomText.subtitle(
              tkChooseLanguage,
            ),
            const SizedBox(height: 16.0),
            // Dropdown button for selecting the language.
            ButtonTheme(
              alignedDropdown: true,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, _) => DropdownButtonFormField<LanguageModel>(
                  isExpanded: true,
                  initialValue: controller.language,
                  icon: const Icon(Icons.expand_more),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  decoration: InputDecoration(
                    hintText: LocalizationService.tr(tkChooseLanguage),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 16.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                  items: LocalizationViewModel.supportedLanguages
                      .map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        children: [
                          CustomText.subtitle(e.name),
                        ],
                      ),
                    ),
                  )
                      .toList(),
                  onChanged: controller.onChange, // Handle the language change.
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Confirm button to save the selected language.
            CustomButton(
              text: tkConfirmBtn,
              onPressed: _confirm,
            ),
          ],
        ),
      ),
    );
  }

  /// Confirms the language change and saves it using the `LocalizationViewModel`.
  void _confirm() {
    controller.saveLanguageChange();
    RouteManager.back(); // Close the dialog.
  }

  /// Closes the dialog and dismisses any unsaved changes.
  void _close() {
    controller.dismiss();
    RouteManager.back(); // Close the dialog.
  }
}

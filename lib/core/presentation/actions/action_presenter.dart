import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/core/errors/app_exception.dart';
import '../../routing/route_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sentry/sentry.dart';
import '/shared/shared.dart';
import '/modules/locale/data/services/localization_service.dart';
import '/shared/presentation/custom/customs.dart';
import '/shared/presentation/app_feedback.dart';

/// Handles actions with error handling, loading indicators, and UI feedback.
class ActionPresenter {
  /// Method to handle an asynchronous action with error handling and loading indicator.
  ///
  /// `action`: The async function to be executed.
  /// `onSuccess`: Optional callback to be executed on successful completion of the action.
  /// `onFailure`: Optional callback to be executed on failure.
  Future<void> actionHandler(
      BuildContext context,
      AsyncCallback action, {
        VoidCallback? onSuccess,
        VoidCallback? onFailure,
      }) async {
    // Show the loading overlay during the action execution (guarded).
    try {
      if (context.mounted) {
        context.loaderOverlay.show();
      }
    } catch (_) {/* no overlay present; ignore */}
    try {
      // Execute the provided action.
      await action();

      // Call the onSuccess callback if provided.
      if (onSuccess != null) {
        onSuccess();
      }
    } on AppException catch (e, stackTrace) {
      // Handle specific AppException with custom prefix and message.
      _handleException(e, stackTrace, e.prefix, e.message);
      if (onFailure != null) onFailure(); // Call onFailure if provided.
    } catch (e, stackTrace) {
      // Handle generic exceptions with a more specific message for auth errors.
      final bool isAuth = e is AuthException || e.toString().toLowerCase().contains('unauthorized');
      final String title = tkError;
      final String message = isAuth ? 'Invalid email or password' : tkSomethingWentWrongMsg;
      _handleException(e, stackTrace, title, message);
      if (onFailure != null) onFailure(); // Call onFailure if provided.
    } finally {
      // Hide the loading overlay after the action completes (guarded).
      try {
        if (context.mounted) {
          context.loaderOverlay.hide();
        }
      } catch (_) {/* no overlay present; ignore */}
    }
  }

  /// Method to handle an asynchronous action without loading indicator.
  ///
  /// `action`: The async function to be executed.
  /// `onSuccess`: Optional callback to be executed on successful completion of the action.
  /// `onFailure`: Optional callback to be executed on failure.
  Future<void> actionHandlerWithoutLoading(
      AsyncCallback action, {
        VoidCallback? onSuccess,
        VoidCallback? onFailure,
      }) async {
    try {
      // Execute the provided action.
      await action();

      // Call the onSuccess callback if provided.
      if (onSuccess != null) {
        onSuccess();
      }
    } on AppException catch (e, stackTrace) {
      // Handle specific AppException with custom prefix and message.
      _handleException(e, stackTrace, e.prefix, e.message);
      if (onFailure != null) onFailure(); // Call onFailure if provided.
    } catch (e, stackTrace) {
      // Handle generic exceptions with a default error message.
      _handleException(e, stackTrace, tkError, tkSomethingWentWrongMsg);
      if (onFailure != null) onFailure(); // Call onFailure if provided.
    }
  }

  /// Handles exceptions by logging, showing a snackbar, and capturing in Sentry.
  ///
  /// `e`: The exception to handle.
  /// `stackTrace`: The associated stack trace.
  /// `title`: The title of the error.
  /// `message`: The message to display to the user.
  void _handleException(
      dynamic e,
      StackTrace stackTrace,
      String title,
      String message,
      ) async {
    if (kDebugMode) {
      print(stackTrace); // Print stack trace in debug mode.
      log(e.toString()); // Log the error message.
    }

    // Display an error snackbar.
    showErrorSnackBar(title, message);

    // Capture the exception in Sentry for tracking.
    await Sentry.captureException(
      e,
      stackTrace: stackTrace,
    );
  }

  /// Displays an error snackbar using GetX.
  ///
  /// `title`: The title of the error message.
  /// `message`: The message to display to the user.
  void showErrorSnackBar(String title, String message) {
    final messenger = rootScaffoldMessengerKey.currentState;
    if (messenger == null) return;

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(24.0),
          backgroundColor: ColorManager.lightBackgroundColor,
          content: Row(
            children: [
              const Icon(
                Icons.error_rounded,
                color: ColorManager.negativeColor,
                size: 24.0,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${title.isNotEmpty ? LocalizationService.tr(title) : 'Error'}: ${LocalizationService.tr(message)}',
                  style: const TextStyle(color: ColorManager.titleColor),
                ),
              ),
            ],
          ),
        ),
      );
  }

  /// Displays a success snackbar using GetX.
  ///
  /// `title`: The title of the success message.
  /// `message`: The message to display to the user.
  void showSuccessSnackBar(String title, String message) {
    final messenger = rootScaffoldMessengerKey.currentState;
    if (messenger == null) return;

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(24.0),
          backgroundColor: ColorManager.lightBackgroundColor,
          content: Row(
            children: [
              const Icon(
                Icons.check,
                color: ColorManager.positiveColor,
                size: 24.0,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${LocalizationService.tr(title)}: ${LocalizationService.tr(message)}',
                  style: const TextStyle(color: ColorManager.titleColor),
                ),
              ),
            ],
          ),
        ),
      );
  }

  /// Displays a confirmation dialog using GetX.
  ///
  /// `message`: The confirmation message to display.
  Future<bool> showConfirmationDialog(
      BuildContext context, [
        String message = 'Are you sure',
      ]) async {
    return await showDialog<bool>(
          context: context,
          builder: (dialogContext) => Dialog(
            backgroundColor: ColorManager.darkBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText.title(message),
                  const SizedBox(height: 24.0),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton.positive(
                          text: 'Yes',
                          onPressed: () => Navigator.pop(dialogContext, true),
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      Expanded(
                        child: CustomButton.negative(
                          text: 'No',
                          onPressed: () => Navigator.pop(dialogContext, false),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ) ??
        false;
  }


  void back() {
    RouteManager.back();
  }
}

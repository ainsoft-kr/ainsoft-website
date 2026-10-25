import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '/app.dart';
import '/app_module.dart';
import '/core/routing/route_manager.dart';
import '/core/infrastructure/fonts/app_font_loader.dart';
import '/core/infrastructure/loading/app_loading_indicator.dart';
import '/core/infrastructure/storage/preferences_storage.dart';
import '/modules/locale/data/services/localization_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppFontLoader.ensureReady();
  await PreferencesStorage.instance.initialize();

  // Initialize localization with saved preference
  LocalizationService.init();

  runApp(
    ModularApp(
      module: appModule,
      navigatorKey: RouteManager.navigatorKey,
      defaultTransition: TransitionType.none,
      child: const App(),
    ),
  );

  WidgetsBinding.instance.addPostFrameCallback((_) {
    hideAinsoftLoading();
  });
}

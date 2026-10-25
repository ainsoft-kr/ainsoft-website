import 'package:flutter_modular/flutter_modular.dart';

import '/modules/connections/controllers/connection_view_model.dart';
import '/modules/locale/controllers/localization_view_model.dart';
import '/modules/theme/controllers/theme_view_model.dart';
import '/modules/theme/data/services/theme_service.dart';

/// App-wide services. Path-less, so its binds are root-owned and never disposed.
final coreModule = createModule(
  register: (c) {
    c.addLazySingleton<ThemeService>(ThemeService.new);
    c.addLazySingleton<ThemeViewModel>(ThemeViewModel.new);
    c.addLazySingleton<LocalizationViewModel>(LocalizationViewModel.new);
    c.addLazySingleton<ConnectionViewModel>(ConnectionViewModel.new);
  },
);

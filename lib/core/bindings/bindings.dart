import 'package:flutter_modular/flutter_modular.dart';

import '/modules/connections/controllers/connection_view_model.dart';
import '/modules/locale/controllers/localization_view_model.dart';
import '/modules/theme/controllers/theme_view_model.dart';
import '/modules/theme/data/services/theme_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<ThemeService>(ThemeService.new);
    i.addLazySingleton<ThemeViewModel>(ThemeViewModel.new);
    i.addLazySingleton<LocalizationViewModel>(LocalizationViewModel.new);
    i.addLazySingleton<ConnectionViewModel>(ConnectionViewModel.new);
  }
}

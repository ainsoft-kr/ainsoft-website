import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '/modules/connections/views/connection_overlay.dart';
import '/modules/locale/controllers/localization_view_model.dart';
import '/modules/locale/data/services/localization_service.dart';
import '/modules/theme/controllers/theme_view_model.dart';
import '/shared/design/design.dart';
import '/shared/presentation/app_feedback.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = Modular.get<ThemeViewModel>();
    final localeVM = Modular.get<LocalizationViewModel>();

    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (context) => const SpinKitCubeGrid(
        color: Colors.white,
        size: 50.0,
      ),
      child: ConnectionOverlay(
        child: AnimatedBuilder(
          animation: Listenable.merge([themeVM, localeVM]),
          builder: (context, _) => MaterialApp.router(
            routerConfig: Modular.routerConfig,
            scaffoldMessengerKey: rootScaffoldMessengerKey,
            locale: localeVM.locale,
            supportedLocales: LocalizationService.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeVM.themeMode,
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child ?? const SizedBox.shrink(),
              breakpoints: const [
                Breakpoint(start: 0, end: 599, name: MOBILE),
                Breakpoint(start: 600, end: 1023, name: TABLET),
                Breakpoint(start: 1024, end: 1439, name: DESKTOP),
                Breakpoint(start: 1440, end: double.infinity, name: 'WIDE'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

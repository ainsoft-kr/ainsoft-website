import 'package:flutter/material.dart';
import '/modules/auth/views/splash.dart';
import '/modules/home/views/home_page.dart';
import '/shared/modules/app_shell/app_shell_layout.dart';
import 'auth_handler.dart';
import 'login.dart';

/// **AuthPage**
///
/// App entry page that renders the appropriate subtree based on authentication
/// state via [AuthHandler]: splash while checking, login when unauthenticated,
/// and the main menu when authenticated.
///
/// Why
/// - Centralizes the auth-gate rendering logic in one place.
///
/// Key Features
/// - Uses [AuthHandler] to observe [AuthViewModel] state and switch UI.
/// - Composes `onChecking`, `onNotAuthenticated`, and `onAuthenticated` widgets.
// ────────────────────────────────────────────────
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthHandler(
      onAuthenticated: const AppShellLayout(
        currentRoute: '/home',
        child: HomePage(),
      ),
      onNotAuthenticated: LoginPage(),
      onChecking: const SplashPage(),
    );
  }
}

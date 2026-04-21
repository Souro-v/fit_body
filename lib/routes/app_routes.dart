// lib/routes/app_routes.dart

import 'package:flutter/material.dart';

import '../screens/signin_andup/forgot_password.dart';
import '../screens/signin_andup/onboarding_screen.dart';
import '../screens/signin_andup/login_screen.dart';
import '../screens/signin_andup/register_screen.dart';
import '../screens/signin_andup/set_password_screen.dart';

import '../screens/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash          = '/';
  static const String onboarding      = '/onboarding';
  static const String login           = '/login';
  static const String register        = '/register';
  static const String forgotPassword  = '/forgot-password';
  static const String setPassword     = '/set-password';
  static const String home            = '/home';
  static const String profile         = '/profile';
  static const String dashboard       = '/dashboard';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
      case AppRoutes.onboarding:
        return _slide(const OnboardingScreen(), settings);
      case AppRoutes.login:
        return _slide(const LoginScreen(), settings);
      case AppRoutes.register:
        return _slide(const RegisterScreen(), settings);
      case AppRoutes.forgotPassword:
        return _slide(const ForgotPasswordScreen(), settings);
      case AppRoutes.setPassword:
        return _slide(const SetPasswordScreen(), settings);
      case AppRoutes.home:
        return _slide(const HomeScreen(), settings);
      default:
        return _errorRoute(settings.name);
    }
  }

  static PageRouteBuilder _slide(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(1.0, 0.0);
        const end   = Offset.zero;
        final tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 350),
    );
  }

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text('Route not found: $name',
              style: const TextStyle(color: Colors.white70)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/help_screen.dart';
import '../screens/setup/setup_activity_screen.dart';
import '../screens/setup/setup_age_screen.dart';
import '../screens/setup/setup_gender_screen.dart';
import '../screens/setup/setup_goal_screen.dart';
import '../screens/setup/setup_height_screen.dart';
import '../screens/setup/setup_intro_screen.dart';
import '../screens/setup/setup_profile_screen.dart';
import '../screens/setup/setup_weight_screen.dart';
import '../screens/signin_andup/forgot_password.dart';
import '../screens/signin_andup/onboarding_screen.dart';
import '../screens/signin_andup/login_screen.dart';
import '../screens/signin_andup/register_screen.dart';
import '../screens/signin_andup/set_password_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/home_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/notification_settings_screen.dart';
import '../screens/password_settings_screen.dart';
import '../screens/notifications_screen.dart';


class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String setPassword = '/set-password';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String dashboard = '/dashboard';
  static const String setupIntro = '/setup';
  static const String setupGender = '/setup-gender';
  static const String setupAge = '/setup-age';
  static const String setupWeight = '/setup-weight';
  static const String setupHeight = '/setup-height';
  static const String setupGoal = '/setup-goal';
  static const String setupActivity = '/setup-activity';
  static const String setupProfile = '/setup-profile';
  static const String editProfile = '/edit-profile';
  static const String favorites = '/favorites';
  static const String settings             = '/settings';
  static const String notificationSettings = '/notification-settings';
  static const String passwordSettings     = '/password-settings';
  static const String help     = '/Help';
  static const String notifications = '/notifications';


}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _slide(const HomeScreen(), settings);
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
      case AppRoutes.setupIntro:
        return _slide(const SetupIntroScreen(), settings);
      case AppRoutes.setupGender:
        return _slide(const SetupGenderScreen(), settings);
      case AppRoutes.setupAge:
        return _slide(const SetupAgeScreen(), settings);
      case AppRoutes.setupWeight:
        return _slide(const SetupWeightScreen(), settings);
      case AppRoutes.setupHeight:
        return _slide(const SetupHeightScreen(), settings);
      case AppRoutes.setupGoal:
        return _slide(const SetupGoalScreen(), settings);
      case AppRoutes.setupActivity:
        return _slide(const SetupActivityScreen(), settings);
      case AppRoutes.setupProfile:
        return _slide(const SetupProfileScreen(), settings);
      case AppRoutes.dashboard:
        return _slide(const DashboardScreen(), settings);
      case AppRoutes.profile:
        return _slide(const ProfileScreen(), settings);
      case AppRoutes.editProfile:
        return _slide(const EditProfileScreen(), settings);
      case AppRoutes.favorites:
        return _slide(const FavoritesScreen(), settings);
      case AppRoutes.settings:
        return _slide(const SettingsScreen(), settings);
      case AppRoutes.notificationSettings:
        return _slide(const NotificationSettingsScreen(), settings);
      case AppRoutes.passwordSettings:
        return _slide(const PasswordSettingsScreen(), settings);
      case AppRoutes.help:
        return _slide(const HelpScreen(), settings);
      case AppRoutes.notifications:
        return _slide(const NotificationsScreen(), settings);
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
        const end = Offset.zero;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: Curves.easeInOut));
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
          child: Text(
            'Route not found: $name',
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}

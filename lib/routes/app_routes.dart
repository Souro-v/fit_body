import 'package:flutter/material.dart';
import '../screens/challenge_detail_screen.dart';
import '../screens/community_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/help_screen.dart';
import '../screens/meal_idea_detail_screen.dart';
import '../screens/meal_ideas_list_screen.dart';
import '../screens/meal_ideas_screen.dart';
import '../screens/meal_plan_creating_screen.dart';
import '../screens/meal_plan_detail_screen.dart';
import '../screens/meal_plan_goals_screen.dart';
import '../screens/meal_plan_preferences_screen.dart';
import '../screens/meal_plan_result_screen.dart';
import '../screens/meal_plans_screen.dart';
import '../screens/nutrition_screen.dart';
import '../screens/progress_tracking_screen.dart';
import '../screens/recommendation_detail_screen.dart';
import '../screens/recommendations_screen.dart';
import '../screens/search_screen.dart';
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
import '../screens/weekly_challenge/weekly_challenge_complete_screen.dart';
import '../screens/weekly_challenge/weekly_challenge_intro_screen.dart';
import '../screens/weekly_challenge/weekly_challenge_rounds_screen.dart';
import '../screens/weekly_challenge/weekly_challenge_video_screen.dart';
import '../screens/workout_screen.dart';
import '../screens/workout_detail_screen.dart';
import '../screens/create_routine_screen.dart';
import '../screens/your_routine_screen.dart';
import '../screens/routine_detail_screen.dart';

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
  static const String settings = '/settings';
  static const String notificationSettings = '/notification-settings';
  static const String passwordSettings = '/password-settings';
  static const String help = '/Help';
  static const String search = '/search';
  static const String notifications = '/notifications';
  static const String workout = '/workout';
  static const String workoutDetail = '/workout-detail';
  static const String createRoutine = '/create-routine';
  static const String yourRoutine = '/your-routine';
  static const String routineDetail = '/routine-detail';
  static const String progressTracking = '/progress-tracking';
  static const String nutrition = '/nutrition';
  static const String mealPlans = '/meal-plans';
  static const String mealPlanPreferences = '/meal-plan-preferences';
  static const String mealPlanGoals = '/meal-plan-goals';
  static const String mealPlanCreating = '/meal-plan-creating';
  static const String mealPlanResult = '/meal-plan-result';
  static const String mealPlanDetail = '/meal-plan-detail';
  static const String mealIdeas = '/meal-ideas';
  static const String mealIdeasList = '/meal-ideas-list';
  static const String mealIdeaDetail = '/meal-idea-detail';
  static const String community = '/community';
  static const String challengeDetail = '/challenge-detail';
  static const String challengeRounds = '/challenge-rounds';
  static const String challengeVideo = '/challenge-video';
  static const String recommendations      = '/recommendations';
  static const String recommendationDetail = '/recommendation-detail';
  static const String weeklyChallenge = '/weekly-challenge';
  static const String weeklyChallengeRounds   = '/weekly-challenge-rounds';
  static const String weeklyChallengeVideo    = '/weekly-challenge-video';
  static const String weeklyChallengeComplete = '/weekly-challenge-complete';

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
      case AppRoutes.search:
        return _slide(const SearchScreen(), settings);
      case AppRoutes.workout:
        return _slide(const WorkoutScreen(), settings);
      case AppRoutes.workoutDetail:
        return _slide(const WorkoutDetailScreen(), settings);
      case AppRoutes.createRoutine:
        return _slide(const CreateRoutineScreen(), settings);
      case AppRoutes.yourRoutine:
        return _slide(const YourRoutineScreen(), settings);
      case AppRoutes.routineDetail:
        return _slide(const RoutineDetailScreen(), settings);
      case AppRoutes.progressTracking:
        return _slide(const ProgressTrackingScreen(), settings);
      case AppRoutes.nutrition:
        return _slide(const NutritionScreen(), settings);
      case AppRoutes.mealPlans:
        return _slide(const MealPlansScreen(), settings);
      case AppRoutes.mealPlanPreferences:
        return _slide(const MealPlanPreferencesScreen(), settings);
      case AppRoutes.mealPlanGoals:
        return _slide(const MealPlanGoalsScreen(), settings);
      case AppRoutes.mealPlanCreating:
        return _slide(const MealPlanCreatingScreen(), settings);
      case AppRoutes.mealPlanResult:
        return _slide(const MealPlanResultScreen(), settings);
      case AppRoutes.mealPlanDetail:
        return _slide(const MealPlanDetailScreen(), settings);
      case AppRoutes.mealIdeas:
        return _slide(const MealIdeasScreen(), settings);
      case AppRoutes.mealIdeasList:
        return _slide(const MealIdeasListScreen(), settings);
      case AppRoutes.mealIdeaDetail:
        return _slide(const MealIdeaDetailScreen(), settings);
      case AppRoutes.community:
        return _slide(const CommunityScreen(), settings);
      case AppRoutes.challengeDetail:
        return _slide(const ChallengeDetailScreen(), settings);
      case AppRoutes.challengeRounds:
        return _slide(const ChallengeRoundsScreen(), settings);
      case AppRoutes.challengeVideo:
        return _slide(const ChallengeVideoScreen(), settings);
      case AppRoutes.recommendations:
        return _slide(const RecommendationsScreen(), settings);
      case AppRoutes.recommendationDetail:
        return _slide(const RecommendationDetailScreen(), settings);
      case AppRoutes.weeklyChallenge:
        return _slide(const WeeklyChallengeScreen(), settings);
      case AppRoutes.weeklyChallengeRounds:
        return _slide(const WeeklyChallengeRoundsScreen(), settings);
      case AppRoutes.weeklyChallengeVideo:
        return _slide(const WeeklyChallengeVideoScreen(), settings);
      case AppRoutes.weeklyChallengeComplete:
        return _slide(const WeeklyChallengeCompleteScreen(), settings);
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

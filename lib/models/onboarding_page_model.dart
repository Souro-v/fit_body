// lib/models/onboarding_page_model.dart
//
// Each OnboardingPageModel drives one slide.
// ─────────────────────────────────────────────────────────────────────────────
// HOW TO UPDATE:
//   • bgImage   → path inside assets/images/
//   • iconPath  → path inside assets/icons/   (set to '' for splash screen)
//   • title     → headline text shown on the card
// ─────────────────────────────────────────────────────────────────────────────

import '../constants/app_assets.dart';

class OnboardingPageModel {
  final String bgImage;   // background photo
  final String iconPath;  // yellow illustration icons (empty = no icons card)
  final String title;     // headline
  final bool isSplash;    // true  → shows the brand splash (Screen 2-A)

  const OnboardingPageModel({
    required this.bgImage,
    required this.title,
    this.iconPath = '',
    this.isSplash = false,
  });
}

// ─── DATA ────────────────────────────────────────────────────────────────────
// Update bgImage / iconPath / title strings to match your real assets.

const List<OnboardingPageModel> kOnboardingPages = [
  // 2-A  Splash / welcome screen (no card, just the logo overlay)
  OnboardingPageModel(
    bgImage: AppAssets.splashBg,
    title: 'Welcome to FitBody',
    isSplash: true,
  ),

  // 2-B  Active lifestyle
  OnboardingPageModel(
    bgImage: AppAssets.onboard1Bg,
    iconPath: 'assets/icons/ic_active_lifestyle.png',
    title: 'Start Your Journey Towards A More Active Lifestyle',
  ),

  // 2-C  Nutrition
  OnboardingPageModel(
    bgImage: AppAssets.onboard2Bg,
    iconPath: 'assets/icons/ic_nutrition.png',
    title: 'Find Nutrition Tips That Fit Your Lifestyle',
  ),

  // 2-D  Community
  OnboardingPageModel(
    bgImage: AppAssets.onboard3Bg,
    iconPath: 'assets/icons/ic_community.png',
    title: 'A Community For You, Challenge Yourself',
  ),
];

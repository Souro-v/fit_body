// lib/screens/onboarding_screen.dart
//
// Full onboarding flow  –  4 swipeable pages (2-A → 2-D)
// Uses PageView for swiping + smooth_page_indicator for the dots.
import 'package:flutter/material.dart';
import '../../models/onboarding_page_model.dart';
import '../../routes/app_routes.dart';
import '../../widgets/onboarding_page_widgets.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  bool get _isLastPage => _currentPage == kOnboardingPages.length - 1;

  void _goNext() {
    if (_isLastPage){
    _onGetStarted();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onGetStarted() {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ── Page content ─────────────────────────────────────────────────
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: kOnboardingPages.length,
            itemBuilder: (context, index) {
              return OnboardingPageWidget(
                model: kOnboardingPages[index],
                currentPage: _currentPage,
                totalPages: kOnboardingPages.length,
                pageController: _controller,
                onNext: _goNext,
                onSkip: _onGetStarted,
              );
            },
          ),
        ],
      ),
    );
  }
}

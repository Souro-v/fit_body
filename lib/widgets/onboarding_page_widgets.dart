// lib/widgets/onboarding_page_widget.dart
//
// Renders a single onboarding slide.
// Layout matches the design:  full-bleed photo  +  bottom card  +  buttons.


import 'package:flutter/material.dart';

import '../models/onboarding_page_model.dart';
import 'app_image.dart';

// ─── Colour palette (edit here to retheme the whole app) ─────────────────────
const _kPurple     = Color(0xFFB39DDB); // lavender card bg
const _kYellow     = Color(0xFFE8E44A); // accent / logo / icons
const _kDotActive  = Color(0xFFE8E44A);
const _kDotInactive= Color(0x66FFFFFF);
const _kBtnBg      = Color(0xFF212121); // dark pill button
const _kBtnText    = Colors.white;

class OnboardingPageWidget extends StatelessWidget {
  const OnboardingPageWidget({
    super.key,
    required this.model,
    required this.currentPage,
    required this.totalPages,
    required this.pageController,
    required this.onNext,
    required this.onSkip,
  });

  final OnboardingPageModel model;
  final int currentPage;
  final int totalPages;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  bool get _isLastPage => currentPage == totalPages - 1;
  bool get _isSplash   => model.isSplash;

  // ── helpers ────────────────────────────────────────────────────────────────

  /// Returns an ImageProvider that gracefully falls back to a solid colour
  /// when the asset file does not yet exist in the project.
  ImageProvider _bgProvider() {
    try {
      return AssetImage(model.bgImage);
    } catch (_) {
      // No image yet → transparent (the grey overlay will show)
      return const AssetImage('assets/images/placeholder.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // ── 1. Background photo ─────────────────────────────────────────────
        AppBgImage(assetPath: model.bgImage),

        // ── 2. Dark gradient overlay (bottom 55%) ──────────────────────────
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.35, 1.0],
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
        ),

        // ── 3. Content ──────────────────────────────────────────────────────
        if (_isSplash)
          _SplashContent(model: model)
        else
          _CardContent(
            model: model,
            currentPage: currentPage,
            totalPages: totalPages,
            isLastPage: _isLastPage,
            onNext: onNext,
            onSkip: onSkip,
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Splash layout  (Screen 2-A)
// ─────────────────────────────────────────────────────────────────────────────
class _SplashContent extends StatelessWidget {
  const _SplashContent({required this.model});
  final OnboardingPageModel model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo box
          Container(
            width: 140,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: _kYellow, width: 3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Replace with your ic_logo.png ────────────────────────
                  // Image.asset('assets/icons/ic_logo.png', height: 50)
                  // ─── Placeholder ─────────────────────────────────────────
                  const Text(
                    'F',
                    style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Welcome to',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'FITBODY',
            style: TextStyle(
              color: _kYellow,
              fontSize: 36,
              fontWeight: FontWeight.w900,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Card layout  (Screens 2-B, 2-C, 2-D)
// ─────────────────────────────────────────────────────────────────────────────
class _CardContent extends StatelessWidget {
  const _CardContent({
    required this.model,
    required this.currentPage,
    required this.totalPages,
    required this.isLastPage,
    required this.onNext,
    required this.onSkip,
  });

  final OnboardingPageModel model;
  final int currentPage;
  final int totalPages;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Column(
      children: [
        // Skip button – top right
        Padding(
          padding: const EdgeInsets.only(top: 56, right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: onSkip,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 13),
                ],
              ),
            ),
          ),
        ),

        const Spacer(),

        // ── Purple card ───────────────────────────────────────────────────
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          decoration: BoxDecoration(
            color: _kPurple.withOpacity(0.88),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              // Icon
              if (model.iconPath.isNotEmpty)
                AppIconImage(
                  assetPath: model.iconPath,
                  size: 52,
                  // tint yellow চাইলে: color: _kYellow
                )
              else
                const Icon(Icons.fitness_center, color: _kYellow, size: 44),

              const SizedBox(height: 12),

              // Title
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 16),

              // Dots indicator
              _DotsRow(currentPage: currentPage - 1, totalPages: totalPages - 1),

              const SizedBox(height: 20),

              // Next / Get Started button
              _PillButton(
                label: isLastPage ? 'Get Started' : 'Next',
                onTap: onNext,
              ),
            ],
          ),
        ),

        SizedBox(height: 28 + bottomPadding),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sub-widgets
// ─────────────────────────────────────────────────────────────────────────────

/// Displays the yellow icon from assets.
/// Shows a placeholder icon if the asset is not yet added.
class _IconWidget extends StatelessWidget {
  const _IconWidget({required this.iconPath, this.tintYellow = false});
  final String iconPath;
  // tintYellow = true  → single-color white/black PNG কে yellow করে
  // tintYellow = false → আপনার icon এর original color রাখে (default)
  final bool tintYellow;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      width: 52,
      height: 52,
      fit: BoxFit.contain,
      color: tintYellow ? _kYellow : null,
      errorBuilder: (_, __, ___) => const Icon(
        Icons.image_not_supported_outlined,
        color: _kYellow,
        size: 52,
      ),
    );
  }
}

/// Dot-row progress indicator.
class _DotsRow extends StatelessWidget {
  const _DotsRow({required this.currentPage, required this.totalPages});
  final int currentPage;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (i) {
        final active = i == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width:  active ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? _kDotActive : _kDotInactive,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

/// Dark pill-shaped button.
class _PillButton extends StatelessWidget {
  const _PillButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _kBtnBg,
          borderRadius: BorderRadius.circular(28),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: _kBtnText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Background image with graceful fallback
// ─────────────────────────────────────────────────────────────────────────────
class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({required this.bgImage});
  final String bgImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        bgImage,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorBuilder: (_, __, ___) => Container(
          color: const Color(0xFF1A1A1A),
          child: const Center(
            child: Icon(Icons.add_photo_alternate_outlined,
                color: Colors.white24, size: 60),
          ),
        ),
      ),
    );
  }
}

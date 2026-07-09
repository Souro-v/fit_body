// lib/widgets/app_image.dart
//
// সব image এখান থেকে render হবে।
// এক জায়গায় rule set → সব screen এ apply।
//
// ─────────────────────────────────────────────────────────────────────────────
// RULE (সবসময় মনে রাখবেন):
//   • Background photo  → AppBgImage()   — full screen, উপর থেকে কাটে না
//   • Logo / illustration → AppLogoImage() — contain, shape নষ্ট হয় না
//   • Icon (small)      → AppIconImage()  — fixed size, contain
// ─────────────────────────────────────────────────────────────────────────────

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ─── 1. Full-screen background image ─────────────────────────────────────────
class AppBgImage extends StatelessWidget {
  const AppBgImage({
    super.key,
    required this.assetPath,
    this.alignment = Alignment.topCenter,
  });

  final String assetPath;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (assetPath.startsWith('http')) {
      return SizedBox.expand(
        child: CachedNetworkImage(
          imageUrl: assetPath,
          fit: BoxFit.cover,
          alignment: alignment,
          placeholder: (_, __) => Container(color: const Color(0xFF1A1A1A)),
          errorWidget: (_, __, ___) => Container(
            color: const Color(0xFF1A1A1A),
            child: const Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: Colors.white24,
                size: 48,
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox.expand(
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        alignment: alignment,
        errorBuilder: (_, __, ___) => Container(
          color: const Color(0xFF1A1A1A),
          child: const Center(
            child: Icon(
              Icons.add_photo_alternate_outlined,
              color: Colors.white24,
              size: 48,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── 2. Logo / illustration image ────────────────────────────────────────────
// নির্দিষ্ট width/height দিলে সেটার মধ্যে fit হবে, stretch হবে না।
class AppLogoImage extends StatelessWidget {
  const AppLogoImage({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
  });

  final String assetPath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    // MediaQuery দিয়ে screen width বের করে responsive size set করে
    // যেকোনো screenshot size হোক, logo সবসময় screen এর ৪০% নেবে
    final screenWidth = MediaQuery.of(context).size.width;
    final resolvedWidth = width ?? screenWidth * 0.40;

    return Image.asset(
      assetPath,
      width: resolvedWidth,
      height: height,
      fit: BoxFit.contain,
      // aspect ratio ঠিক রাখে, distort হয় না
      alignment: Alignment.topCenter,
      errorBuilder: _placeholder,
    );
  }
}

// ─── 3. Small icons image ──────────────────────────────────────────────────────
// Square icons, fixed size, original color রাখে।
class AppIconImage extends StatelessWidget {
  const AppIconImage({
    super.key,
    required this.assetPath,
    this.size = 52,
    this.color, // tint color, null = original color
    this.fallbackIcon = Icons.image_not_supported_outlined,
  });

  final String assetPath;
  final double size;
  final Color? color;
  final IconData fallbackIcon;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
      color: color,
      errorBuilder: (_, __, ___) =>
          Icon(fallbackIcon, size: size * 0.8, color: color ?? Colors.white38),
    );
  }
}

// ─── Shared placeholder ───────────────────────────────────────────────────────
Widget _placeholder(BuildContext ctx, Object err, StackTrace? st) {
  return Container(
    color: const Color(0xFF1A1A1A),
    child: const Center(
      child: Icon(
        Icons.add_photo_alternate_outlined,
        color: Colors.white24,
        size: 48,
      ),
    ),
  );
}

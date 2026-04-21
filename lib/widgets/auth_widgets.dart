// lib/widgets/auth_widgets.dart
//
// সব auth screen এ ব্যবহৃত shared widgets এখানে।
// একটা জায়গা থেকে রঙ / style পরিবর্তন করলে সব screen আপডেট হয়।

import 'package:flutter/material.dart';

// ─── Colour tokens ────────────────────────────────────────────────────────────
class AppColors {
  AppColors._();

  static const bg        = Color(0xFF1A1025); // deep dark purple-black
  static const card      = Color(0xFF2A1F3D); // card background
  static const accent    = Color(0xFFB39DDB); // lavender
  static const yellow    = Color(0xFFE8E44A); // FitBody yellow
  static const inputBg   = Color(0xFF3B2F52); // text field fill
  static const inputBorder = Color(0xFF5C4E7A);
  static const btnBg     = Color(0xFF2D2D2D); // dark pill button
  static const titleColor= Color(0xFFE8E44A); // header title yellow
}

// ─── Top bar (back arrow + title) ────────────────────────────────────────────
class AuthTopBar extends StatelessWidget {
  const AuthTopBar({super.key, required this.title, this.onBack});
  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBack ?? () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white70, size: 18),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.titleColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),
      ],
    );
  }
}

// ─── Lavender card wrapper ────────────────────────────────────────────────────
class AuthCard extends StatelessWidget {
  const AuthCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.inputBorder.withOpacity(0.4)),
      ),
      child: child,
    );
  }
}

// ─── Field label ─────────────────────────────────────────────────────────────
class AuthLabel extends StatelessWidget {
  const AuthLabel(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// ─── Text field ───────────────────────────────────────────────────────────────
class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscure = false,
    this.keyboardType,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38, fontSize: 13),
        filled: true,
        fillColor: AppColors.inputBg,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
      ),
    );
  }
}

// ─── Primary dark pill button ─────────────────────────────────────────────────
class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({super.key, required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.btnBg,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white12),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}

// ─── "or sign up with" divider ────────────────────────────────────────────────
class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(label,
              style: const TextStyle(color: Colors.white38, fontSize: 12)),
        ),
        const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
      ],
    );
  }
}

// ─── Social login buttons (Google, Facebook, Instagram) ──────────────────────
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialBtn(
          assetPath: 'assets/icons/ic_google.png',
          icon: Icons.g_mobiledata,   // asset না থাকলে fallback
          onTap: () {},
        ),
        const SizedBox(width: 16),
        _SocialBtn(
          assetPath: 'assets/icons/ic_facebook.png',
          icon: Icons.facebook,
          onTap: () {},
        ),
        const SizedBox(width: 16),
        _SocialBtn(
          assetPath: 'assets/icons/ic_instagram.png',
          icon: Icons.camera_alt_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}

class _SocialBtn extends StatelessWidget {
  const _SocialBtn({
    required this.onTap,
    this.icon,          // placeholder icon (asset না থাকলে)
    this.assetPath,     // আপনার icon asset path
  });
  final IconData? icon;
  final String? assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.card,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.inputBorder),
        ),
        padding: const EdgeInsets.all(12),
        child: assetPath != null
            ? Image.asset(
          assetPath!,
          fit: BoxFit.contain,
          // original color রাখে (social brand colors)
          errorBuilder: (_, __, ___) =>
              Icon(icon ?? Icons.account_circle, color: Colors.white70, size: 26),
        )
            : Icon(icon ?? Icons.account_circle, color: Colors.white70, size: 26),
      ),
    );
  }
}

// ─── "Don't have an account? Sign Up" switch text ─────────────────────────────
class AuthSwitchText extends StatelessWidget {
  const AuthSwitchText({
    super.key,
    required this.prefix,
    required this.actionText,
    required this.onTap,
  });

  final String prefix;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 13, color: Colors.white54),
          children: [
            TextSpan(text: prefix),
            TextSpan(
              text: actionText,
              style: const TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

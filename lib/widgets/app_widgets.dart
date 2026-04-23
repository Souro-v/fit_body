// lib/widgets/app_widgets.dart
// সব reusable widgets এখানে

import 'package:flutter/material.dart';
import 'app_image.dart';

// ─── Colors ───────────────────────────────────────────────────────────────────
class AppColors {
  AppColors._();
  static const bg         = Color(0xFF1A1025);
  static const card       = Color(0xFF2A1F3D);
  static const purple     = Color(0xFFB39DDB);
  static const yellow     = Color(0xFFE8E44A);
  static const inputBg    = Colors.white;
  static const dark       = Color(0xFF2D2D2D);
}

// ─── 1. Bottom Navigation Bar ─────────────────────────────────────────────────
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;

  final _icons = const [
    'assets/icons/ic_nav_home.png',
    'assets/icons/ic_nav_workout.png',
    'assets/icons/ic_nav_favorite.png',
    'assets/icons/ic_nav_profile.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (i) {
          final selected = i == currentIndex;
          return GestureDetector(
            onTap: () => onTap(i),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: selected
                    ? Colors.white.withValues(alpha: 0.3)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: AppIconImage(
                assetPath: _icons[i],
                size: 26,
                color: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─── 2. Top App Bar ───────────────────────────────────────────────────────────
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.actions,
  });
  final String title;
  final bool showBack;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bg,
      elevation: 0,
      leading: showBack
          ? GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios,
                color: AppColors.yellow, size: 14),
            Text('Back',
                style: TextStyle(
                    color: AppColors.yellow, fontSize: 13)),
          ],
        ),
      )
          : null,
      leadingWidth: 80,
      title: Text(title,
          style: const TextStyle(
              color: AppColors.purple,
              fontSize: 18,
              fontWeight: FontWeight.w700)),
      actions: actions,
    );
  }
}

// ─── 3. Section Header ("Recommendations" + "See All") ───────────────────────
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
  });
  final String title;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        const Spacer(),
        if (onSeeAll != null)
          GestureDetector(
            onTap: onSeeAll,
            child: const Row(
              children: [
                Text('See All',
                    style: TextStyle(
                        color: AppColors.purple, fontSize: 13)),
                Icon(Icons.arrow_forward_ios,
                    color: AppColors.purple, size: 12),
              ],
            ),
          ),
      ],
    );
  }
}

// ─── 4. Workout / Article Card ────────────────────────────────────────────────
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.subtitle,
    this.minutes,
    this.kcal,
    this.width = 160,
    this.height = 200,
    this.onTap,
  });
  final String imagePath;
  final String title;
  final String? subtitle;
  final String? minutes;
  final String? kcal;
  final double width;
  final double height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AppBgImage(assetPath: imagePath),
              // Dark gradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8)
                    ],
                  ),
                ),
              ),
              // Star
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.star_border,
                    color: Colors.white, size: 20),
              ),
              // Play button
              if (minutes != null)
                const Positioned(
                  bottom: 52,
                  right: 8,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.purple,
                    child: Icon(Icons.play_arrow,
                        color: Colors.white, size: 16),
                  ),
                ),
              // Info
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                      if (minutes != null) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.access_time,
                                color: AppColors.purple, size: 12),
                            const SizedBox(width: 3),
                            Text(minutes!,
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10)),
                            const SizedBox(width: 8),
                            const Icon(Icons.local_fire_department,
                                color: AppColors.purple, size: 12),
                            const SizedBox(width: 3),
                            Text(kcal ?? '',
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10)),
                          ],
                        ),
                      ],
                      if (subtitle != null)
                        Text(subtitle!,
                            style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── 5. Toggle Switch ─────────────────────────────────────────────────────────
class AppToggle extends StatelessWidget {
  const AppToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.yellow;
        return Colors.white38;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.yellow.withValues(alpha: 0.4);
        return Colors.white12;
      }),
    );
  }
}

// ─── 6. Profile Menu Item ─────────────────────────────────────────────────────
class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.trailing,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70, size: 22),
            const SizedBox(width: 16),
            Text(label,
                style: const TextStyle(
                    color: Colors.white, fontSize: 15)),
            const Spacer(),
            trailing ??
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.white38, size: 14),
          ],
        ),
      ),
    );
  }
}

// ─── 7. Input Field ───────────────────────────────────────────────────────────
class AppInputField extends StatelessWidget {
  const AppInputField({
    super.key,
    required this.label,
    required this.controller,
    this.hint = '',
    this.obscure = false,
    this.keyboardType,
  });
  final String label;
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: AppColors.yellow,
                fontSize: 13,
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.black, fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38),
            filled: true,
            fillColor: AppColors.inputBg,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── 8. Primary Button ────────────────────────────────────────────────────────
class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.color = AppColors.yellow,
    this.textColor = Colors.black,
  });
  final String label;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Text(label,
            style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
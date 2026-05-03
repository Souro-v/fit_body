// lib/screens/weekly_challenge_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart';
import '../widgets/app_image.dart';
import '../routes/app_routes.dart';

class WeeklyChallengeScreen extends StatefulWidget {
  const WeeklyChallengeScreen({super.key});

  @override
  State<WeeklyChallengeScreen> createState() => _WeeklyChallengeScreenState();
}

class _WeeklyChallengeScreenState extends State<WeeklyChallengeScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ── Full screen background ────────────────────────────────────
          AppBgImage(assetPath: 'assets/images/weekly_challengeBG.png'),

          // ── Dark overlay ──────────────────────────────────────────────
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.5),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // ── Top bar ───────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 20),
                      ),
                      const Spacer(),
                      const Icon(Icons.star_border,
                          color: Colors.white, size: 24),
                      const SizedBox(width: 16),
                      const Icon(Icons.notifications_none,
                          color: Colors.white, size: 24),
                      const SizedBox(width: 16),
                      const Icon(Icons.person_outline,
                          color: Colors.white, size: 24),
                    ],
                  ),
                ),

                const Spacer(),

                // ── Card ─────────────────────────────────────────────
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.purple.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppIconImage(
                            assetPath:
                            'assets/icons/ic_active_lifestyle.png',
                            size: 28,
                            color: AppColors.yellow,
                          ),
                          const SizedBox(width: 10),
                          const Text('Weekly Challenge',
                              style: TextStyle(
                                  color: AppColors.yellow,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            height: 1.5),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ── Start Now button ──────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.challengeRounds),
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white24),
                      ),
                      alignment: Alignment.center,
                      child: const Text('Start Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
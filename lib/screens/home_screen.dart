// lib/screens/home_screen.dart
//
// FitBody Home Screen — dark background + centered logo
// লোগো image থাকলে asset থেকে load করবে,
// না থাকলে Flutter widget দিয়ে recreate করবে।

import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Logo ────────────────────────────────────────────────────────
            // আপনার logo image assets/images/home_logo.png এ রাখলে
            // নিচের widget টা uncomment করুন এবং _FBLogoWidget() সরিয়ে দিন:
            //
            // AppLogoImage(
            //   assetPath: 'assets/images/home_logo.png',
            //   // width দিতে হবে না — screen এর ৪০% automatically নেবে
            // ),
            //
            // এখন Flutter widget দিয়ে logo দেখাচ্ছে:
            const _FBLogoWidget(),

            const SizedBox(height: 20),

            // ── FITBODY text ─────────────────────────────────────────────────
            const Text(
              'FITBODY',
              style: TextStyle(
                color: Color(0xFFE8E44A),
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── FB Logo Widget (Flutter দিয়ে recreate) ────────────────────────────────────
class _FBLogoWidget extends StatelessWidget {
  const _FBLogoWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 90,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ── "FB" text ───────────────────────────────────────────────────
          const Positioned(
            left: 0,
            bottom: 0,
            child: Text(
              'FB',
              style: TextStyle(
                color: Color(0xFF7C6FCD), // purple
                fontSize: 72,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                height: 1,
              ),
            ),
          ),

          // ── Running figure (yellow) ──────────────────────────────────────
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFE8E44A),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.directions_run,
                color: Color(0xFF1C1C1E),
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

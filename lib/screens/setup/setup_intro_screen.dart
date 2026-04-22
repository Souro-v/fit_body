import 'package:flutter/material.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/app_image.dart';

class SetupIntroScreen extends StatelessWidget {
  const SetupIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          AppBgImage(assetPath: 'assets/images/setup_bg.png'),
          // gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 1.0],
                colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
              ),
            ),
          ),
          // content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Consistency Is\nThe Key To Progress.\nDon't Give Up!",
                    style: TextStyle(
                      color: Color(0xFFE8E44A),
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB39DDB).withOpacity(0.85),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _NextButton(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.setupGender),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white12),
        ),
        alignment: Alignment.center,
        child: const Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

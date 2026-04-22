import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/app_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.onboarding),
        child: Center(
          child: AppLogoImage(
            assetPath: 'assets/images/home_logo.png',
          ),
        ),
      ),
    );
  }
}
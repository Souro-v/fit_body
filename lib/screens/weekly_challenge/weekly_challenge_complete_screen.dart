import 'package:flutter/material.dart';
import '../../widgets/app_image.dart';
import '../../widgets/app_widgets.dart';
import '../../routes/app_routes.dart';

class WeeklyChallengeCompleteScreen extends StatefulWidget {
  const WeeklyChallengeCompleteScreen({super.key});

  @override
  State<WeeklyChallengeCompleteScreen> createState() =>
      _WeeklyChallengeCompleteScreenState();
}

class _WeeklyChallengeCompleteScreenState
    extends State<WeeklyChallengeCompleteScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios,
                      color: AppColors.yellow, size: 20),
                ),
              ),
            ),

            const Spacer(),

            // Trophy
            AppIconImage(
              assetPath: 'assets/icons/ic_trophy.png',
              size: 180,
            ),

            const Spacer(),

            // Congratulations card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text('Congratulations!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _StatCol(
                          icon: Icons.access_time, value: '2 Hours'),
                      _StatCol(
                          icon: Icons.local_fire_department,
                          value: '300 Calories'),
                      _StatCol(
                          icon: Icons.directions_run, value: 'Moderate'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AppPrimaryButton(
                    label: 'Go to the next workout',
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.workout, (route) => false),
                    color: AppColors.purple,
                    textColor: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  AppPrimaryButton(
                    label: 'Home',
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.dashboard, (route) => false),
                    color: AppColors.yellow,
                    textColor: AppColors.purple,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}

class _StatCol extends StatelessWidget {
  const _StatCol({required this.icon, required this.value});
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Icon(icon, color: Colors.black54, size: 20),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/app_image.dart';
import '../../routes/app_routes.dart';
import 'weekly_challenge_widgets.dart';

class WeeklyChallengeVideoScreen extends StatefulWidget {
  const WeeklyChallengeVideoScreen({super.key});

  @override
  State<WeeklyChallengeVideoScreen> createState() =>
      _WeeklyChallengeVideoScreenState();
}

class _WeeklyChallengeVideoScreenState
    extends State<WeeklyChallengeVideoScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final exercise =
    ModalRoute.of(context)?.settings.arguments as WCExercise?;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios,
                        color: AppColors.yellow, size: 16),
                  ),
                  const SizedBox(width: 8),
                  const Text('Weekly Challenge',
                      style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  const Spacer(),
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.search),
                    icon: const Icon(Icons.search,
                        color: Colors.white70, size: 22),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(
                        context, AppRoutes.notifications),
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.white70, size: 22),
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.profile),
                    icon: const Icon(Icons.person_outline,
                        color: Colors.white70, size: 22),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // Video
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.purple.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 300,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AppBgImage(
                                assetPath:
                                'assets/images/weekly_challengeBG.png'),
                            Container(
                              color:
                              AppColors.purple.withValues(alpha: 0.2),
                            ),
                            const Center(
                              child: CircleAvatar(
                                radius: 44,
                                backgroundColor: AppColors.purple,
                                child: Icon(Icons.play_arrow,
                                    color: Colors.white, size: 48),
                              ),
                            ),
                            const Positioned(
                              top: 12,
                              right: 12,
                              child: Icon(Icons.star,
                                  color: AppColors.yellow, size: 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Info card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(exercise?.title ?? 'Pull Out',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        const Text(
                          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Sed Cursus Libero Eget.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              height: 1.5),
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time,
                                color: Colors.black54, size: 14),
                            SizedBox(width: 4),
                            Text('10 Minutes',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                            SizedBox(width: 16),
                            Icon(Icons.fitness_center,
                                color: Colors.black54, size: 14),
                            SizedBox(width: 4),
                            Text('3 Rep',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                            SizedBox(width: 16),
                            Icon(Icons.person_outline,
                                color: Colors.black54, size: 14),
                            SizedBox(width: 4),
                            Text('Beginner',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  AppPrimaryButton(
                    label: 'Next Exercise',
                    onTap: () => Navigator.pushReplacementNamed(
                        context, AppRoutes.weeklyChallengeComplete),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
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
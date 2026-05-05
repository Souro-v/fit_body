import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/app_image.dart';
import '../../routes/app_routes.dart';
import 'weekly_challenge_widgets.dart';

class WeeklyChallengeRoundsScreen extends StatefulWidget {
  const WeeklyChallengeRoundsScreen({super.key});

  @override
  State<WeeklyChallengeRoundsScreen> createState() =>
      _WeeklyChallengeRoundsScreenState();
}

class _WeeklyChallengeRoundsScreenState
    extends State<WeeklyChallengeRoundsScreen> {
  int _currentIndex = 1;

  final _rounds = [
    WCRound(title: 'Round 1', exercises: [
      WCExercise(
          title: 'Pull Out',
          duration: '00:30',
          repetition: 'Repetition 3x'),
      WCExercise(
          title: 'Jumping Pull-Ups',
          duration: '00:15',
          repetition: 'Repetition 2x'),
      WCExercise(
          title: 'Negative Pull-Up',
          duration: '00:10',
          repetition: 'Repetition 2x'),
    ]),
    WCRound(title: 'Round 2', exercises: [
      WCExercise(
          title: 'Pull Out/Push-Ups',
          duration: '00:10',
          repetition: 'Repetition 2x'),
      WCExercise(
          title: 'Pull Out/Push-Ups',
          duration: '00:10',
          repetition: 'Repetition 4x'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
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
                  // Banner
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.purple.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 160,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AppBgImage(
                                assetPath:
                                'assets/images/fav_pull_out.png'),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.8),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 12,
                              right: 12,
                              child: WCBadge(label: 'Pull Out'),
                            ),
                            const Positioned(
                              bottom: 12,
                              left: 12,
                              right: 12,
                              child: Row(
                                children: [
                                  Icon(Icons.access_time,
                                      color: AppColors.purple, size: 12),
                                  SizedBox(width: 3),
                                  Text('10 Minutes',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11)),
                                  SizedBox(width: 10),
                                  Icon(Icons.local_fire_department,
                                      color: AppColors.purple, size: 12),
                                  SizedBox(width: 3),
                                  Text('120 Kcal',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11)),
                                  SizedBox(width: 10),
                                  Icon(Icons.fitness_center,
                                      color: AppColors.purple, size: 12),
                                  SizedBox(width: 3),
                                  Text('Beginner',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11)),
                                  Spacer(),
                                  Icon(Icons.star_border,
                                      color: Colors.white, size: 18),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Rounds
                  ..._rounds.map((round) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(round.title,
                          style: const TextStyle(
                              color: AppColors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      ...round.exercises.map((ex) => WCExerciseCard(
                        exercise: ex,
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.weeklyChallengeVideo,
                          arguments: ex,
                        ),
                      )),
                      const SizedBox(height: 16),
                    ],
                  )),

                  const SizedBox(height: 20),
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
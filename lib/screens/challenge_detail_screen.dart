// lib/screens/challenge_detail_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';

class ChallengeDetailScreen extends StatefulWidget {
  const ChallengeDetailScreen({super.key});

  @override
  State<ChallengeDetailScreen> createState() =>
      _ChallengeDetailScreenState();
}

class _ChallengeDetailScreenState extends State<ChallengeDetailScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final item =
    ModalRoute.of(context)?.settings.arguments as _ChallengeItem?;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Full screen background
          AppBgImage(
              assetPath: item?.image ?? 'assets/images/workout_cardio.png'),

          // Dark overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // ── Top bar ────────────────────────────────────────────
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

                // ── Bottom card ────────────────────────────────────────
                Container(
                  margin: const EdgeInsets.all(20),
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
                            assetPath: 'assets/icons/ic_active_lifestyle.png',
                            size: 28,
                            color: AppColors.yellow,
                          ),
                          const SizedBox(width: 10),
                          Text(item?.title ?? 'Cycling Challenge',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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

                // ── Start Now button ───────────────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.challengeRounds,
                      arguments: item,
                    ),
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

// ── Challenge Rounds Screen (7.4.2-C) ─────────────────────────────────────────
class ChallengeRoundsScreen extends StatefulWidget {
  const ChallengeRoundsScreen({super.key});

  @override
  State<ChallengeRoundsScreen> createState() =>
      _ChallengeRoundsScreenState();
}

class _ChallengeRoundsScreenState extends State<ChallengeRoundsScreen> {
  int _currentIndex = 1;

  final _rounds = [
    _Round(title: 'Round 1', exercises: [
      _Exercise(title: 'Endurance Ride', duration: '00:30', level: 'Moderate'),
      _Exercise(title: 'Hill Climbs', duration: '00:00', level: 'High'),
      _Exercise(title: 'Interval Sprints', duration: '00:00', level: 'High'),
    ]),
    _Round(title: 'Round 2', exercises: [
      _Exercise(title: 'Tempo Ride', duration: '00:00', level: 'Moderate'),
      _Exercise(title: 'Cadence Drill', duration: '00:00', level: 'Moderate'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    final item =
    ModalRoute.of(context)?.settings.arguments as _ChallengeItem?;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar ──────────────────────────────────────────────────
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
                  // ── Banner ───────────────────────────────────────────
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 160,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AppBgImage(
                              assetPath: item?.image ??
                                  'assets/images/workout_cardio.png'),
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
                          Positioned(
                            bottom: 12,
                            left: 12,
                            right: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item?.title ?? 'Cycling Challenge',
                                    style: const TextStyle(
                                        color: AppColors.yellow,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 4),
                                const Row(
                                  children: [
                                    Icon(Icons.access_time,
                                        color: AppColors.purple, size: 12),
                                    SizedBox(width: 3),
                                    Text('45 Minutes',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 11)),
                                    SizedBox(width: 10),
                                    Icon(Icons.local_fire_department,
                                        color: AppColors.purple, size: 12),
                                    SizedBox(width: 3),
                                    Text('70 Kcal',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 11)),
                                    SizedBox(width: 10),
                                    Icon(Icons.fitness_center,
                                        color: AppColors.purple, size: 12),
                                    SizedBox(width: 3),
                                    Text('5 Exercises',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 11)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Rounds ───────────────────────────────────────────
                  ..._rounds.map((round) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(round.title,
                          style: const TextStyle(
                              color: AppColors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 12),
                      ...round.exercises.map((ex) => GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.challengeVideo,
                          arguments: _ChallengeVideoArgs(
                            image: item?.image ??
                                'assets/images/workout_cardio.png',
                            exerciseTitle: ex.title,
                            level: ex.level,
                          ),
                        ),
                        child: _ExerciseCard(exercise: ex),
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

// ── Challenge Video Screen (7.4.2-D) ──────────────────────────────────────────
class ChallengeVideoScreen extends StatefulWidget {
  const ChallengeVideoScreen({super.key});

  @override
  State<ChallengeVideoScreen> createState() =>
      _ChallengeVideoScreenState();
}

class _ChallengeVideoScreenState extends State<ChallengeVideoScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
    as _ChallengeVideoArgs?;

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
                    onPressed: () {},
                    icon: const Icon(Icons.search,
                        color: Colors.white70, size: 22),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.white70, size: 22),
                  ),
                  IconButton(
                    onPressed: () {},
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 260,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AppBgImage(
                              assetPath: args?.image ??
                                  'assets/images/workout_cardio.png'),
                          Container(
                            color: AppColors.purple.withValues(alpha: 0.3),
                          ),
                          const Center(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.purple,
                              child: Icon(Icons.play_arrow,
                                  color: Colors.white, size: 44),
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

                  const SizedBox(height: 16),

                  // Info card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(args?.exerciseTitle ?? 'Interval Sprints',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.timer_outlined,
                                color: Colors.black54, size: 14),
                            const SizedBox(width: 4),
                            const Text('7 Minutes',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                            const SizedBox(width: 16),
                            const Icon(Icons.fitness_center,
                                color: Colors.black54, size: 14),
                            const SizedBox(width: 4),
                            Text(args?.level ?? 'High',
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                            const SizedBox(width: 16),
                            const Icon(Icons.person_outline,
                                color: Colors.black54, size: 14),
                            const SizedBox(width: 4),
                            const Text('Advanced',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
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

// ── Exercise card ──────────────────────────────────────────────────────────────
class _ExerciseCard extends StatelessWidget {
  const _ExerciseCard({required this.exercise});
  final _Exercise exercise;

  Color get _levelColor =>
      exercise.level == 'High' ? AppColors.yellow : AppColors.purple;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: _levelColor,
            child: const Icon(Icons.play_arrow,
                color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Row(children: [
                  const Icon(Icons.timer_outlined,
                      color: Colors.black54, size: 12),
                  const SizedBox(width: 3),
                  Text(exercise.duration,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 11)),
                ]),
              ],
            ),
          ),
          Text(exercise.level,
              style: TextStyle(
                  color: _levelColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ── Models ─────────────────────────────────────────────────────────────────────
class _ChallengeItem {
  final String image;
  final String title;
  final String description;

  const _ChallengeItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class _ChallengeVideoArgs {
  final String image;
  final String exerciseTitle;
  final String level;

  _ChallengeVideoArgs({
    required this.image,
    required this.exerciseTitle,
    required this.level,
  });
}

class _Round {
  final String title;
  final List<_Exercise> exercises;
  _Round({required this.title, required this.exercises});
}

class _Exercise {
  final String title;
  final String duration;
  final String level;
  _Exercise({
    required this.title,
    required this.duration,
    required this.level,
  });
}
import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';

class WorkoutDetailScreen extends StatefulWidget {
  const WorkoutDetailScreen({super.key});

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
  int _currentIndex = 1;

  final _rounds = [
    _Round(title: 'Round 1', exercises: [
      _Exercise(
          title: 'Dumbbell Rows',
          duration: '00:30',
          repetition: 'Repetition 3x'),
      _Exercise(
          title: 'Russian Twists',
          duration: '00:15',
          repetition: 'Repetition 2x'),
      _Exercise(
          title: 'Squats',
          duration: '00:30',
          repetition: 'Repetition 3x'),
    ]),
    _Round(title: 'Round 2', exercises: [
      _Exercise(
          title: 'Tabata Intervals',
          duration: '00:10',
          repetition: 'Repetition 2x'),
      _Exercise(
          title: 'Bicycle Crunches',
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
                  const Text('Beginner',
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
                  // ── Video banner ────────────────────────────────────
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 200,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          AppBgImage(
                              assetPath:
                              'assets/images/workout_thumb1.png'),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.6),
                                ],
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 12,
                            right: 12,
                            child: _Badge(label: 'Functional Training'),
                          ),
                          Positioned(
                            bottom: 12,
                            left: 12,
                            right: 12,
                            child: Row(
                              children: [
                                const Icon(Icons.access_time,
                                    color: AppColors.purple, size: 12),
                                const SizedBox(width: 3),
                                const Text('45 Minutes',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11)),
                                const SizedBox(width: 10),
                                const Icon(Icons.local_fire_department,
                                    color: AppColors.purple, size: 12),
                                const SizedBox(width: 3),
                                const Text('1450 Kcal',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11)),
                                const SizedBox(width: 10),
                                const Icon(Icons.fitness_center,
                                    color: AppColors.purple, size: 12),
                                const SizedBox(width: 3),
                                const Text('Beginner',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 11)),
                                const Spacer(),
                                const Icon(Icons.star_border,
                                    color: Colors.white, size: 18),
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
                      ...round.exercises
                          .map((ex) => _ExerciseCard(exercise: ex)),
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

// ── Exercise card ──────────────────────────────────────────────────────────────
class _ExerciseCard extends StatelessWidget {
  const _ExerciseCard({required this.exercise});
  final _Exercise exercise;

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
          // Play button
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: AppColors.purple,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.play_arrow,
                color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          // Title + duration
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
                Row(
                  children: [
                    const Icon(Icons.timer_outlined,
                        color: AppColors.purple, size: 12),
                    const SizedBox(width: 3),
                    Text(exercise.duration,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
          // Repetition
          Text(exercise.repetition,
              style: const TextStyle(
                  color: AppColors.purple,
                  fontSize: 12,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.w600)),
    );
  }
}

// ── Models ─────────────────────────────────────────────────────────────────────
class _Round {
  final String title;
  final List<_Exercise> exercises;
  _Round({required this.title, required this.exercises});
}

class _Exercise {
  final String title;
  final String duration;
  final String repetition;
  _Exercise({
    required this.title,
    required this.duration,
    required this.repetition,
  });
}
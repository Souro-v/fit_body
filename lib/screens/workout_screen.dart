import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int _currentIndex = 1;
  String _selectedLevel = 'Beginner';

  final _levels = ['Beginner', 'Intermediate', 'Advanced'];

  final _workouts = [
    _WorkoutItem(
      image: 'assets/images/fav_upper_body.png',
      title: 'Upper Body',
      minutes: '60 Minutes',
      kcal: '1320 Kcal',
      exercises: '5 Exercises',
    ),
    _WorkoutItem(
      image: 'assets/images/workout_thumb2.png',
      title: 'Full Body Stretching',
      minutes: '45 Minutes',
      kcal: '1450 Kcal',
      exercises: '5 Exercises',
    ),
    _WorkoutItem(
      image: 'assets/images/workout_glutes.png',
      title: 'Glutes & Abs',
      minutes: '30 Minutes',
      kcal: '900 Kcal',
      exercises: '5 Exercises',
    ),
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
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.yellow,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Workout',
                    style: TextStyle(
                      color: AppColors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.search),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white70,
                      size: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.notifications),
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white70,
                      size: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.profile),
                    icon: const Icon(
                      Icons.person_outline,
                      color: Colors.white70,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Level tabs ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: _levels.map((level) {
                  final selected = _selectedLevel == level;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedLevel = level),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.yellow : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected ? AppColors.yellow : Colors.white24,
                        ),
                      ),
                      child: Text(
                        level,
                        style: TextStyle(
                          color: selected ? Colors.black : Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // ── Content ──────────────────────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // Training of the day banner
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.workoutDetail),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 180,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AppBgImage(
                              assetPath: 'assets/images/workout_thumb1.png',
                            ),
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
                            // Badge
                            const Positioned(
                              top: 12,
                              right: 12,
                              child: _Badge(label: 'Training Of The Day'),
                            ),
                            // Info
                            Positioned(
                              bottom: 12,
                              left: 12,
                              right: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Functional Training',
                                    style: TextStyle(
                                      color: AppColors.yellow,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        color: AppColors.purple,
                                        size: 12,
                                      ),
                                      const SizedBox(width: 3),
                                      const Text(
                                        '45 Minutes',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(
                                        Icons.local_fire_department,
                                        color: AppColors.purple,
                                        size: 12,
                                      ),
                                      const SizedBox(width: 3),
                                      const Text(
                                        '1450 Kcal',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(
                                        Icons.fitness_center,
                                        color: AppColors.purple,
                                        size: 12,
                                      ),
                                      const SizedBox(width: 3),
                                      const Text(
                                        '5 Exercises',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.star_border,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Section title
                  Text(
                    "Let's Go $_selectedLevel",
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Explore Different Workout Styles',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),

                  const SizedBox(height: 16),

                  // Workout list
                  ..._workouts.map(
                    (item) => _WorkoutCard(
                      item: item,
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.workoutDetail),
                    ),
                  ),

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

// ── Workout card ───────────────────────────────────────────────────────────────
class _WorkoutCard extends StatelessWidget {
  const _WorkoutCard({required this.item, required this.onTap});

  final _WorkoutItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: AppColors.purple,
                        size: 12,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.minutes,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: AppColors.purple,
                        size: 12,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.kcal,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(
                        Icons.fitness_center,
                        color: AppColors.purple,
                        size: 12,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.exercises,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 110,
                height: 90,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppBgImage(assetPath: item.image),
                    const Positioned(
                      top: 6,
                      right: 6,
                      child: Icon(
                        Icons.star_border,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Badge widget ───────────────────────────────────────────────────────────────
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
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Model ──────────────────────────────────────────────────────────────────────
class _WorkoutItem {
  final String image;
  final String title;
  final String minutes;
  final String kcal;
  final String exercises;

  _WorkoutItem({
    required this.image,
    required this.title,
    required this.minutes,
    required this.kcal,
    required this.exercises,
  });
}

// lib/screens/recommendations_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart';
import '../widgets/app_image.dart';
import '../routes/app_routes.dart';

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  int _currentIndex = 1;

  final _popular = [
    _RecItem(
      image: 'assets/images/workout_thumb1.png',
      title: 'Squat Exercise',
      minutes: '12 Minutes',
      kcal: '120 Kcal',
    ),
    _RecItem(
      image: 'assets/images/workout_thumb2.png',
      title: 'Full Body Stretching',
      minutes: '12 Minutes',
      kcal: '120 Kcal',
    ),
    _RecItem(
      image: 'assets/images/workout_thumb1.png',
      title: 'Squat Exercise',
      minutes: '12 Minutes',
      kcal: '120 Kcal',
    ),
    _RecItem(
      image: 'assets/images/workout_thumb2.png',
      title: 'Full Body Stretching',
      minutes: '12 Minutes',
      kcal: '120 Kcal',
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
                    child: const Icon(Icons.arrow_back_ios,
                        color: AppColors.yellow, size: 16),
                  ),
                  const SizedBox(width: 8),
                  const Text('Recommendations',
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
                  // ── Featured banner ──────────────────────────────────
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.recommendationDetail,
                      arguments: _RecItem(
                        image: 'assets/images/fav_dumbbell_step.png',
                        title: 'Dumbbell Step Up',
                        minutes: '12 Minutes',
                        kcal: '120 Kcal',
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 280,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AppBgImage(
                                assetPath:
                                'assets/images/fav_dumbbell_step.png'),
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
                              child: _Badge(label: 'Dumbbell Step Up'),
                            ),
                            // Info
                            const Positioned(
                              bottom: 12,
                              left: 12,
                              right: 12,
                              child: Row(
                                children: [
                                  Icon(Icons.access_time,
                                      color: AppColors.purple, size: 12),
                                  SizedBox(width: 3),
                                  Text('12 Minutes',
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
                                  Spacer(),
                                  Icon(Icons.star,
                                      color: AppColors.yellow, size: 18),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Most Popular ─────────────────────────────────────
                  const Text('Most Popular',
                      style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),

                  const SizedBox(height: 12),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: _popular.length,
                    itemBuilder: (context, index) {
                      final item = _popular[index];
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.recommendationDetail,
                          arguments: item,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              AppBgImage(assetPath: item.image),
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
                                top: 8,
                                right: 8,
                                child: Icon(Icons.star_border,
                                    color: Colors.white, size: 18),
                              ),
                              const Positioned(
                                bottom: 44,
                                right: 8,
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: AppColors.purple,
                                  child: Icon(Icons.play_arrow,
                                      color: Colors.white, size: 16),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                right: 8,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(item.title,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 3),
                                    Row(children: [
                                      const Icon(Icons.access_time,
                                          color: AppColors.purple,
                                          size: 10),
                                      const SizedBox(width: 2),
                                      Text(item.minutes,
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 9)),
                                      const SizedBox(width: 6),
                                      const Icon(
                                          Icons.local_fire_department,
                                          color: AppColors.purple,
                                          size: 10),
                                      const SizedBox(width: 2),
                                      Text(item.kcal,
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 9)),
                                    ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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

// ── Badge ──────────────────────────────────────────────────────────────────────
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

// ── Model ──────────────────────────────────────────────────────────────────────
class RecItem {
  final String image;
  final String title;
  final String minutes;
  final String kcal;

  RecItem({
    required this.image,
    required this.title,
    required this.minutes,
    required this.kcal,
  });
}

class _RecItem extends RecItem {
  _RecItem({
    required super.image,
    required super.title,
    required super.minutes,
    required super.kcal,
  });
}
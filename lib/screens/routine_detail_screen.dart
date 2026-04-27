// lib/screens/routine_detail_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import 'create_routine_screen.dart';

class RoutineDetailScreen extends StatefulWidget {
  const RoutineDetailScreen({super.key});

  @override
  State<RoutineDetailScreen> createState() => _RoutineDetailScreenState();
}

class _RoutineDetailScreenState extends State<RoutineDetailScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)?.settings.arguments as ExItem?;

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
                  const Text('Your Routine',
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
                  // ── Video image ──────────────────────────────────────
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 260,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          if (item != null)
                            AppBgImage(assetPath: item.image),
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

                  // ── Info card ────────────────────────────────────────
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          item?.title ?? '',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
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
                            Text(item?.minutes ?? '',
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                            const SizedBox(width: 16),
                            const Icon(Icons.fitness_center,
                                color: Colors.black54, size: 14),
                            const SizedBox(width: 4),
                            Text(item?.rep ?? '',
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
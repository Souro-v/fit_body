// lib/screens/your_routine_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';
import 'create_routine_screen.dart';

class YourRoutineScreen extends StatefulWidget {
  const YourRoutineScreen({super.key});

  @override
  State<YourRoutineScreen> createState() => _YourRoutineScreenState();
}

class _YourRoutineScreenState extends State<YourRoutineScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final items = ModalRoute.of(context)?.settings.arguments
    as List<ExItem>? ??
        [];

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

            // ── Round 1 title ────────────────────────────────────────────
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Round 1',
                    style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
            ),

            const SizedBox(height: 16),

            // ── Grid ─────────────────────────────────────────────────────
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.routineDetail,
                      arguments: item,
                    ),
                    child: _RoutineGridCard(item: item),
                  );
                },
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

class _RoutineGridCard extends StatelessWidget {
  const _RoutineGridCard({required this.item});
  final ExItem item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
            child: Icon(Icons.star_border, color: Colors.white, size: 18),
          ),
          // Play button
          const Positioned(
            bottom: 50,
            right: 8,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.purple,
              child: Icon(Icons.play_arrow, color: Colors.white, size: 16),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          color: AppColors.purple, size: 10),
                      const SizedBox(width: 2),
                      Text(item.minutes,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 9)),
                      const SizedBox(width: 6),
                      const Icon(Icons.fitness_center,
                          color: AppColors.purple, size: 10),
                      const SizedBox(width: 2),
                      Text(item.rep,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 9)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
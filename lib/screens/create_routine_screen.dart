// lib/screens/create_routine_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';

class CreateRoutineScreen extends StatefulWidget {
  const CreateRoutineScreen({super.key});

  @override
  State<CreateRoutineScreen> createState() => _CreateRoutineScreenState();
}

class _CreateRoutineScreenState extends State<CreateRoutineScreen> {
  int _currentIndex = 1;

  final _exercises = [
    ExItem(
      image: 'assets/images/ex_barbell_rows.png',
      title: 'Barbell Rows',
      minutes: '10 Minutes',
      rep: '3 Rep',
    ),
    ExItem(
      image: 'assets/images/ex_hammer_curls.png',
      title: 'Hammer Curls',
      minutes: '15 Minutes',
      rep: '4 Rep',
    ),
    ExItem(
      image: 'assets/images/ex_leg_press.png',
      title: 'Leg Press',
      minutes: '15 Minutes',
      rep: '4 Rep',
    ),
    ExItem(
      image: 'assets/images/fav_split_strength.png',
      title: 'Plank',
      minutes: '10 Minutes',
      rep: '3 Rep',
    ),
    ExItem(
      image: 'assets/images/ex_cable_chest.png',
      title: 'Cable Chest Press',
      minutes: '10 Minutes',
      rep: '3 Rep',
    ),
    ExItem(
      image: 'assets/images/ex_tricep_dips.png',
      title: 'Tricep Dips',
      minutes: '15 Minutes',
      rep: '4 Rep',
    ),
    ExItem(
      image: 'assets/images/ex_push_ups.png',
      title: 'Push-Ups',
      minutes: '10 Minutes',
      rep: '3 Rep',
    ),
    ExItem(
      image: 'assets/images/fav_upper_body.png',
      title: 'TRX Suspension Straps',
      minutes: '10 Minutes',
      rep: '3 Rep',
    ),
  ];

  final Set<int> _selected = {};

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
                  const Text('Create Your Routine',
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

            // ── Grid ─────────────────────────────────────────────────────
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 8),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: _exercises.length,
                itemBuilder: (context, index) {
                  final item = _exercises[index];
                  final isSelected = _selected.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selected.remove(index);
                        } else {
                          _selected.add(index);
                        }
                      });
                    },
                    child: _ExerciseGridCard(
                      item: item,
                      isSelected: isSelected,
                    ),
                  );
                },
              ),
            ),

            // ── Create button ────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: AppPrimaryButton(
                label: 'Create Routine (${_selected.length})',
                onTap: _selected.isEmpty
                    ? () {}
                    : () => Navigator.pushNamed(
                  context,
                  AppRoutes.yourRoutine,
                  arguments: _selected
                      .map((i) => _exercises[i])
                      .toList(),
                ),
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

// ── Grid card ──────────────────────────────────────────────────────────────────
class _ExerciseGridCard extends StatelessWidget {
  const _ExerciseGridCard({
    required this.item,
    required this.isSelected,
  });
  final ExItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [


          AppBgImage(assetPath: item.image),
          // Dark gradient
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
          // Star top right
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.star_border, color: Colors.white, size: 18),
          ),
          // Selected / add icon
          Positioned(
            bottom: 50,
            right: 8,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.purple : Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSelected ? Icons.check : Icons.add,
                color: isSelected ? Colors.white : AppColors.purple,
                size: 18,
              ),
            ),
          ),
          // Info
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

// ── Model ──────────────────────────────────────────────────────────────────────
class ExItem {
  final String image;
  final String title;
  final String minutes;
  final String rep;

  ExItem({
    required this.image,
    required this.title,
    required this.minutes,
    required this.rep,
  });
}
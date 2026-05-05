// lib/screens/meal_plan_goals_screen.dart

import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';
import '../../routes/app_routes.dart';

class MealPlanGoalsScreen extends StatefulWidget {
  const MealPlanGoalsScreen({super.key});

  @override
  State<MealPlanGoalsScreen> createState() => _MealPlanGoalsScreenState();
}

class _MealPlanGoalsScreenState extends State<MealPlanGoalsScreen> {
  int _currentIndex = 1;

  String? _caloricGoal;
  String? _cookingTime;
  String? _servings;

  final _caloricOptions = [
    'Less than 1500 calories',
    '1500-2000 calories',
    'More than 2000 calories',
    "Not sure/Don't have a goal",
  ];

  final _cookingOptions = [
    'Less than 15 minutes',
    '15-30 minutes',
    'More than 30 minutes',
  ];

  final _servingOptions = ['1', '2', '3-4', 'More than 4'];

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
                  const Text('Meal Plans',
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
                  // ── Caloric Goal ─────────────────────────────────────
                  _SectionTitle('Caloric Goal'),
                  const Text('What is your daily caloric intake goal?',
                      style: TextStyle(
                          color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 12),
                  ..._caloricOptions.map((opt) => _RadioRow(
                    label: opt,
                    selected: _caloricGoal == opt,
                    onTap: () =>
                        setState(() => _caloricGoal = opt),
                  )),

                  const SizedBox(height: 20),

                  // ── Cooking Time ─────────────────────────────────────
                  _SectionTitle('Cooking Time Preference'),
                  const Text(
                      'How much time are you willing to spend cooking each meal?',
                      style: TextStyle(
                          color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 12),
                  ..._cookingOptions.map((opt) => _RadioRow(
                    label: opt,
                    selected: _cookingTime == opt,
                    onTap: () =>
                        setState(() => _cookingTime = opt),
                  )),

                  const SizedBox(height: 20),

                  // ── Number of Servings ───────────────────────────────
                  _SectionTitle('Number Of Servings'),
                  const Text('How many servings do you need per meal?',
                      style: TextStyle(
                          color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: _servingOptions.length,
                    itemBuilder: (context, index) {
                      final opt = _servingOptions[index];
                      return _RadioRow(
                        label: opt,
                        selected: _servings == opt,
                        onTap: () =>
                            setState(() => _servings = opt),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  // ── Create button ────────────────────────────────────
                  AppPrimaryButton(
                    label: 'Create',
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.mealPlanCreating),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(title,
          style: const TextStyle(
              color: AppColors.yellow,
              fontSize: 16,
              fontWeight: FontWeight.w700)),
    );
  }
}

class _RadioRow extends StatelessWidget {
  const _RadioRow({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? AppColors.yellow
                      : Colors.white38,
                  width: 2,
                ),
                color: selected ? AppColors.yellow : Colors.transparent,
              ),
              child: selected
                  ? const Icon(Icons.circle,
                  color: Colors.black, size: 10)
                  : null,
            ),
            const SizedBox(width: 10),
            Text(label,
                style: const TextStyle(
                    color: Colors.white, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
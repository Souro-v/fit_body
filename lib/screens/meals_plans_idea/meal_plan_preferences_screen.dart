// lib/screens/meal_plan_preferences_screen.dart

import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';
import '../../routes/app_routes.dart';

class MealPlanPreferencesScreen extends StatefulWidget {
  const MealPlanPreferencesScreen({super.key});

  @override
  State<MealPlanPreferencesScreen> createState() =>
      _MealPlanPreferencesScreenState();
}

class _MealPlanPreferencesScreenState
    extends State<MealPlanPreferencesScreen> {
  int _currentIndex = 1;

  // Dietary Preferences
  final Set<String> _dietary = {};
  final _dietaryOptions = [
    'Vegetarian', 'Keto', 'Vegan', 'Paleo',
    'Gluten-Free', 'No preferences'
  ];

  // Allergies
  final Set<String> _allergies = {};
  final _allergyOptions = [
    'Nuts', 'Eggs', 'Dairy', 'No allergies', 'Shellfish'
  ];

  // Meal Types
  final Set<String> _mealTypes = {};
  final _mealTypeOptions = [
    'Breakfast', 'Dinner', 'Lunch', 'Snacks'
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
                  // ── Dietary Preferences ──────────────────────────────
                  _SectionTitle('Dietary Preferences'),
                  const Text('What are your dietary preferences?',
                      style: TextStyle(
                          color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 12),
                  _CheckboxGrid(
                    options: _dietaryOptions,
                    selected: _dietary,
                    onChanged: (val) => setState(() {
                      _dietary.contains(val)
                          ? _dietary.remove(val)
                          : _dietary.add(val);
                    }),
                  ),

                  const SizedBox(height: 20),

                  // ── Allergies ────────────────────────────────────────
                  _SectionTitle('Allergies'),
                  const Text('Do you have any food allergies we should know about?',
                      style: TextStyle(
                          color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 12),
                  _CheckboxGrid(
                    options: _allergyOptions,
                    selected: _allergies,
                    onChanged: (val) => setState(() {
                      _allergies.contains(val)
                          ? _allergies.remove(val)
                          : _allergies.add(val);
                    }),
                  ),

                  const SizedBox(height: 20),

                  // ── Meal Types ───────────────────────────────────────
                  _SectionTitle('Meal Types'),
                  const Text('Which meals do you want to plan?',
                      style: TextStyle(
                          color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 12),
                  _CheckboxGrid(
                    options: _mealTypeOptions,
                    selected: _mealTypes,
                    onChanged: (val) => setState(() {
                      _mealTypes.contains(val)
                          ? _mealTypes.remove(val)
                          : _mealTypes.add(val);
                    }),
                  ),

                  const SizedBox(height: 32),

                  // ── Next button ──────────────────────────────────────
                  AppPrimaryButton(
                    label: 'Next',
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.mealPlanGoals),
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

class _CheckboxGrid extends StatelessWidget {
  const _CheckboxGrid({
    required this.options,
    required this.selected,
    required this.onChanged,
  });
  final List<String> options;
  final Set<String> selected;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = selected.contains(option);
        return GestureDetector(
          onTap: () => onChanged(option),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.yellow
                        : Colors.white38,
                    width: 2,
                  ),
                  color: isSelected
                      ? AppColors.yellow
                      : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(Icons.circle,
                    color: Colors.black, size: 10)
                    : null,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(option,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 13)),
              ),
            ],
          ),
        );
      },
    );
  }
}
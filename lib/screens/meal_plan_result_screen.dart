import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';

class MealPlanResultScreen extends StatefulWidget {
  const MealPlanResultScreen({super.key});

  @override
  State<MealPlanResultScreen> createState() => _MealPlanResultScreenState();
}

class _MealPlanResultScreenState extends State<MealPlanResultScreen> {
  int _currentIndex = 1;
  int _selectedIndex = 2; // Avocado selected by default

  final _meals = [
    MealItem(
      image: 'assets/images/search_yogurt.png',
      title: 'Delights With Greek Yogurt',
      minutes: '6 Minutes',
      cal: '200 Cal',
    ),
    MealItem(
      image: 'assets/images/meal_spinach_omelette.png',
      title: 'Spinach And Tomato Omelette',
      minutes: '10 Minutes',
      cal: '220 Cal',
    ),
    MealItem(
      image: 'assets/images/fav_avocado_toast.png',
      title: 'Avocado And Egg Toast',
      minutes: '15 Minutes',
      cal: '150 Cal',
    ),
    MealItem(
      image: 'assets/images/meal_protein_shake.png',
      title: 'Protein Shake With Fruits',
      minutes: '9 Minutes',
      cal: '180 Cal',
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

            // ── Title ────────────────────────────────────────────────────
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Breakfast Plan For You',
                      style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 4),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Meal list ────────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _meals.length,
                itemBuilder: (context, index) {
                  final item = _meals[index];
                  final isSelected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: _MealCard(
                      item: item,
                      isSelected: isSelected,
                    ),
                  );
                },
              ),
            ),

            // ── See Recipe button ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: AppPrimaryButton(
                label: 'See Recipe',
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRoutes.mealPlanDetail,
                  arguments: _meals[_selectedIndex],
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

class _MealCard extends StatelessWidget {
  const _MealCard({required this.item, required this.isSelected});
  final MealItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.purple : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Radio button
          Container(
            width: 22,
            height: 22,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.purple : Colors.black26,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: AppColors.purple,
                  shape: BoxShape.circle,
                ),
              ),
            )
                : null,
          ),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Row(children: [
                  const Icon(Icons.access_time,
                      color: AppColors.purple, size: 12),
                  const SizedBox(width: 3),
                  Text(item.minutes,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 11)),
                  const SizedBox(width: 8),
                  const Icon(Icons.local_fire_department,
                      color: AppColors.purple, size: 12),
                  const SizedBox(width: 3),
                  Text(item.cal,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 11)),
                ]),
              ],
            ),
          ),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 90,
              height: 80,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppBgImage(assetPath: item.image),
                  const Positioned(
                    top: 6,
                    right: 6,
                    child: Icon(Icons.star_border,
                        color: Colors.white, size: 16),
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

class MealItem {
  final String image;
  final String title;
  final String minutes;
  final String cal;

  MealItem({
    required this.image,
    required this.title,
    required this.minutes,
    required this.cal,
  });
}
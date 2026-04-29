// lib/screens/meal_ideas_list_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';

class MealIdeasListScreen extends StatefulWidget {
  const MealIdeasListScreen({super.key});

  @override
  State<MealIdeasListScreen> createState() => _MealIdeasListScreenState();
}

class _MealIdeasListScreenState extends State<MealIdeasListScreen> {
  int _currentIndex = 1;
  String _selectedTab = 'Breakfast';

  final _tabs = ['Breakfast', 'Lunch', 'Dinner'];

  final _recommended = [
    MealIdeaItem(
      image: 'assets/images/fav_smoothie.png',
      title: 'Fruit Smoothie',
      minutes: '12 Minutes',
      cal: '120 Cal',
      isVideo: true,
    ),
    MealIdeaItem(
      image: 'assets/images/meal_green_celery.png',
      title: 'Green Celery Juice',
      minutes: '12 Minutes',
      cal: '120 Cal',
      isVideo: true,
    ),
  ];

  final _recipes = [
    MealIdeaItem(
      image: 'assets/images/search_yogurt.png',
      title: 'Delights With Greek Yogurt',
      minutes: '6 Minutes',
      cal: '200 Cal',
      isVideo: false,
    ),
    MealIdeaItem(
      image: 'assets/images/fav_avocado_toast.png',
      title: 'Avocado And Egg Toast',
      minutes: '15 Minutes',
      cal: '150 Cal',
      isVideo: false,
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
                  const Text('Meal Ideas',
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

            const SizedBox(height: 12),

            // ── Tabs ─────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: _tabs.map((tab) {
                  final selected = _selectedTab == tab;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedTab = tab),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.yellow
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: selected
                              ? AppColors.yellow
                              : Colors.white24,
                        ),
                      ),
                      child: Text(tab,
                          style: TextStyle(
                              color: selected
                                  ? Colors.black
                                  : Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  // ── Banner ───────────────────────────────────────────
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.mealIdeaDetail,
                      arguments: MealIdeaItem(
                        image: 'assets/images/meal_spinach_omelette.png',
                        title: 'Spinach And Tomato Omelette',
                        minutes: '10 Minutes',
                        cal: '220 Cal',
                        isVideo: false,
                        ingredients: [
                          '2-3 eggs',
                          'A handful of fresh spinach',
                          '1 small tomato',
                          'Salt and pepper to taste',
                          'Olive oil or butter',
                        ],
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 160,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AppBgImage(
                                assetPath:
                                'assets/images/meal_spinach_omelette.png'),
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
                              top: 12,
                              right: 12,
                              child: _Badge(label: 'Recipe Of The Day'),
                            ),
                            const Positioned(
                              bottom: 12,
                              left: 12,
                              right: 12,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Spinach And Tomato Omelette',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          color: AppColors.purple,
                                          size: 12),
                                      SizedBox(width: 3),
                                      Text('10 Minutes',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 11)),
                                      SizedBox(width: 10),
                                      Icon(Icons.local_fire_department,
                                          color: AppColors.purple,
                                          size: 12),
                                      SizedBox(width: 3),
                                      Text('220 Cal',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 11)),
                                      Spacer(),
                                      Icon(Icons.star_border,
                                          color: Colors.white, size: 18),
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

                  // ── Recommended ──────────────────────────────────────
                  SectionHeader(title: 'Recommended', onSeeAll: () {}),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _recommended.length,
                      itemBuilder: (context, index) {
                        final item = _recommended[index];
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.mealIdeaDetail,
                            arguments: item,
                          ),
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.only(right: 12),
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
                                          Colors.black
                                              .withValues(alpha: 0.8),
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
                                                fontSize: 11,
                                                fontWeight:
                                                FontWeight.w600)),
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
                                          Text(item.cal,
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
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Recipes For You ──────────────────────────────────
                  SectionHeader(title: 'Recipes For You', onSeeAll: () {}),
                  const SizedBox(height: 12),

                  ..._recipes.map((item) => GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.mealIdeaDetail,
                      arguments: item,
                    ),
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
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(item.title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 4),
                                Row(children: [
                                  const Icon(Icons.access_time,
                                      color: AppColors.purple,
                                      size: 12),
                                  const SizedBox(width: 3),
                                  Text(item.minutes,
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 11)),
                                  const SizedBox(width: 8),
                                  const Icon(
                                      Icons.local_fire_department,
                                      color: AppColors.purple,
                                      size: 12),
                                  const SizedBox(width: 3),
                                  Text(item.cal,
                                      style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 11)),
                                ]),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: 100,
                              height: 85,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  AppBgImage(assetPath: item.image),
                                  const Positioned(
                                    top: 6,
                                    right: 6,
                                    child: Icon(Icons.star_border,
                                        color: Colors.white,
                                        size: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
class MealIdeaItem {
  final String image;
  final String title;
  final String minutes;
  final String cal;
  final bool isVideo;
  final List<String> ingredients;

  MealIdeaItem({
    required this.image,
    required this.title,
    required this.minutes,
    required this.cal,
    required this.isVideo,
    this.ingredients = const [],
  });
}
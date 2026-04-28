import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  int _currentIndex = 1;
  String _selectedTab = 'Meal Plans';
  final _recommended = [
    _NutritionItem(
      image: 'assets/images/fav_smoothie.png',
      title: 'Fruit Smoothie',
      minutes: '12 Minutes',
      cal: '120 Cal',
    ),
    _NutritionItem(
      image: 'assets/images/nutrition_quinoa.png',
      title: 'Salads With Quinoa',
      minutes: '12 Minutes',
      cal: '120 Cal',
    ),
  ];

  final _recipes = [
    _NutritionItem(
      image: 'assets/images/fav_avocado_toast.png',
      title: 'Delights With Greek Yogurt',
      minutes: '6 Minutes',
      cal: '200 Cal',
    ),
    _NutritionItem(
      image: 'assets/images/nutrition_salmon.png',
      title: 'Baked Salmon',
      minutes: '30 Minutes',
      cal: '350 Cal',
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
                  const Text('Nutrition',
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

            // ── Tabs ─────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: ['Meal Plans', 'Meal Ideas'].map((tab) {
                  final selected = _selectedTab == tab;
                  return Expanded(
                    child: GestureDetector(
                      onTap: ()  => Navigator.pushNamed(context, AppRoutes.mealPlans),
                      child: Container(
                        margin: EdgeInsets.only(
                            right: tab == 'Meal Plans' ? 8 : 0),
                        height: 44,
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
                        alignment: Alignment.center,
                        child: Text(tab,
                            style: TextStyle(
                                color: selected
                                    ? Colors.black
                                    : Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)),
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
                  // ── Banner ───────────────────────────────────────────
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.purple.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 180,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            AppBgImage(
                                assetPath:
                                'assets/images/nutrition_banner.png'),
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
                                  Text('Carrot And Orange Smoothie',
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
                                      Text('70 Cal',
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
                  SectionHeader(
                    title: 'Recommended',
                    onSeeAll: () {},
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _recommended.length,
                      itemBuilder: (context, index) {
                        final item = _recommended[index];
                        return Container(
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
                                      const SizedBox(height: 3),
                                      Row(
                                        children: [
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
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Recipes For You ──────────────────────────────────
                  SectionHeader(
                    title: 'Recipes For You',
                    onSeeAll: () {},
                  ),

                  const SizedBox(height: 12),

                  ..._recipes.map((item) => _RecipeCard(item: item)),

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

// ── Recipe card ────────────────────────────────────────────────────────────────
class _RecipeCard extends StatelessWidget {
  const _RecipeCard({required this.item});
  final _NutritionItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(item.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Row(children: [
                  const Icon(Icons.access_time,
                      color: AppColors.purple, size: 12),
                  const SizedBox(width: 3),
                  Text(item.minutes,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 11)),
                ]),
                const SizedBox(height: 3),
                Row(children: [
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
                    child: Icon(Icons.star_border,
                        color: Colors.white, size: 18),
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
class _NutritionItem {
  final String image;
  final String title;
  final String minutes;
  final String cal;

  _NutritionItem({
    required this.image,
    required this.title,
    required this.minutes,
    required this.cal,
  });
}
import 'package:flutter/material.dart';
import '../../widgets/app_image.dart';
import '../../widgets/app_widgets.dart';
import '../../routes/app_routes.dart';
import 'meal_plan_result_screen.dart';

class MealPlanDetailScreen extends StatefulWidget {
  const MealPlanDetailScreen({super.key});

  @override
  State<MealPlanDetailScreen> createState() => _MealPlanDetailScreenState();
}

class _MealPlanDetailScreenState extends State<MealPlanDetailScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final item =
    ModalRoute.of(context)?.settings.arguments as MealItem?;

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
                  // ── Title & info ─────────────────────────────────────
                  Text(item?.title ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          color: AppColors.purple, size: 14),
                      const SizedBox(width: 4),
                      Text(item?.minutes ?? '',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 13)),
                      const SizedBox(width: 12),
                      const Icon(Icons.local_fire_department,
                          color: AppColors.purple, size: 14),
                      const SizedBox(width: 4),
                      Text(item?.cal ?? '',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 13)),
                      const Spacer(),
                      const Icon(Icons.star,
                          color: AppColors.yellow, size: 20),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ── Image ────────────────────────────────────────────
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.purple.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 200,
                        child: AppBgImage(
                            assetPath: item?.image ??
                                'assets/images/fav_avocado_toast.png'),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── Ingredients ──────────────────────────────────────
                  const Text('Ingredients',
                      style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  const _BulletText('Wholemeal bread'),
                  const _BulletText('Ripe avocado slices'),
                  const _BulletText('Fried or poached egg'),

                  const SizedBox(height: 20),

                  // ── Preparation ──────────────────────────────────────
                  const Text('Preparation',
                      style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  const Text(
                    'Sed earum sequi est magnam doloremque aut porro dolores sit molestiae fuga. Et rerum inventore ut perspiciatis dolorum sed internos porro aut labore dolorem At quia reiciendis in consequuntur possimus.',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.6),
                  ),

                  const SizedBox(height: 32),

                  // ── Save button ──────────────────────────────────────
                  AppPrimaryButton(
                    label: 'Save Recipes',
                    onTap: () => Navigator.pop(context),
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

class _BulletText extends StatelessWidget {
  const _BulletText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ',
              style: TextStyle(color: Colors.white70, fontSize: 13)),
          Expanded(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white70, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/app_image.dart';
import '../../routes/app_routes.dart';
import 'resources_screen.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key});

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final item =
    ModalRoute.of(context)?.settings.arguments as ArticleItem?;

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
                  const Text('Resources',
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

            // ── Tabs ─────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                children: ['Workout Videos', 'Articles & Tips'].map((tab) {
                  final selected = tab == 'Articles & Tips';
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: tab == 'Workout Videos' ? 8 : 0),
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
                              color:
                              selected ? Colors.black : Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 13)),
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
                  // ── Title ────────────────────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: Text(item?.title ?? '',
                            style: const TextStyle(
                                color: AppColors.yellow,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                      ),
                      const Icon(Icons.star,
                          color: AppColors.yellow, size: 24),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Published date
                  const Row(
                    children: [
                      Icon(Icons.circle,
                          color: AppColors.purple, size: 10),
                      SizedBox(width: 6),
                      Text('Published On September 15',
                          style: TextStyle(
                              color: Colors.white54, fontSize: 12)),
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
                        child: AppBgImage(assetPath: item?.image ?? ''),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── Intro text ───────────────────────────────────────
                  Text(
                    'Discover essential ${item?.title ?? ''} to maximize your workouts and achieve your fitness goals efficiently. Learn how to optimize your routine, prevent injuries, and unlock your full potential in the gym.',
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        height: 1.6),
                  ),

                  const SizedBox(height: 20),

                  // ── Plan Your Routine ────────────────────────────────
                  const _ArticleSection(
                    title: 'Plan Your Routine:',
                    content:
                    'Before starting any workout, plan your routine for the week. Focus on different muscle groups on different days to allow for adequate rest and recovery.',
                  ),

                  const SizedBox(height: 16),

                  // ── Warm-Up ──────────────────────────────────────────
                  const _ArticleSection(
                    title: 'Warm-Up:',
                    content:
                    'Begin your workout with a proper warm-up session. This could include light cardio exercises like jogging or jumping jacks, as well as dynamic stretches to prepare your muscles for the upcoming workout.',
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

class _ArticleSection extends StatelessWidget {
  const _ArticleSection({
    required this.title,
    required this.content,
  });
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: AppColors.yellow,
                fontSize: 14,
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(content,
            style: const TextStyle(
                color: Colors.white70, fontSize: 13, height: 1.6)),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/app_image.dart';
import '../../routes/app_routes.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  int _currentIndex = 1;
  String _selectedTab = 'Articles & Tips';

  final _articles = [
    ArticleItem(
      image: 'assets/images/strength_training.png',
      title: 'Strength Training Tips',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    ArticleItem(
      image: 'assets/images/healthy_weightloss.png',
      title: 'Healthy Weight Loss',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    ArticleItem(
      image: 'assets/images/ex_leg_press.png',
      title: 'Unlock Your Gym Potential',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    ArticleItem(
      image: 'assets/images/weekly_challenge.png',
      title: 'From Beginner To Buff',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
    ArticleItem(
      image: 'assets/images/workout_thumb1.png',
      title: 'Strategies For Gym Success',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
    ),
  ];

  final _videos = [
    ArticleItem(
      image: 'assets/images/fav_loop_band.png',
      title: 'Loop Band Exercises',
      description: '45 Minutes  •  5 Exercises',
    ),
    ArticleItem(
      image: 'assets/images/fav_dumbbell_step.png',
      title: 'Workouts For Beginners',
      description: '45 Minutes  •  5 Exercises',
    ),
    ArticleItem(
      image: 'assets/images/workout_thumb2.png',
      title: 'Full Body Stretch',
      description: '45 Minutes  •  5 Exercises',
    ),
    ArticleItem(
      image: 'assets/images/video_low_impact.png',
      title: 'Low Impact Workouts',
      description: '45 Minutes  •  5 Exercises',
    ),
    ArticleItem(
      image: 'assets/images/fav_pull_out.png',
      title: 'Strength Training',
      description: '45 Minutes  •  5 Exercises',
    ),
    ArticleItem(
      image: 'assets/images/video_split_squats.png',
      title: 'Split Squats Vs Lunges',
      description: '45 Minutes  •  5 Exercises',
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

            const SizedBox(height: 12),

            // ── Tabs ─────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children:
                ['Workout Videos', 'Articles & Tips'].map((tab) {
                  final selected = _selectedTab == tab;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = tab),
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
                                color: selected
                                    ? Colors.black
                                    : Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontSize: 13)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // ── Content ──────────────────────────────────────────────────
            Expanded(
              child: _selectedTab == 'Articles & Tips'
                  ? ListView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  final item = _articles[index];
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.articleDetail,
                      arguments: item,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
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
                                        fontWeight:
                                        FontWeight.w700)),
                                const SizedBox(height: 6),
                                Text(item.description,
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11,
                                        height: 1.4)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius:
                            BorderRadius.circular(12),
                            child: SizedBox(
                              width: 100,
                              height: 90,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  AppBgImage(
                                      assetPath: item.image),
                                  const Positioned(
                                    top: 6,
                                    right: 6,
                                    child: Icon(Icons.star,
                                        color: AppColors.yellow,
                                        size: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  : _WorkoutVideosContent(videos: _videos),
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

// ── Workout Videos content ─────────────────────────────────────────────────────
class _WorkoutVideosContent extends StatelessWidget {
  const _WorkoutVideosContent({required this.videos});
  final List<ArticleItem> videos;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Text('Quick & Easy Workout Videos',
            style: TextStyle(
                color: AppColors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 4),
        const Text('Discover Fresh Workouts: Elevate Your Training',
            style: TextStyle(color: Colors.white54, fontSize: 12)),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final item = videos[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.workoutDetail,
                arguments: 'Beginner',
              ),
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
                            Colors.black.withValues(alpha: 0.8),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.star,
                          color: AppColors.yellow, size: 18),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,
                              style: const TextStyle(
                                  color: AppColors.yellow,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 3),
                          Text(item.description,
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 9)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

// ── Model ──────────────────────────────────────────────────────────────────────
class ArticleItem {
  final String image;
  final String title;
  final String description;

  ArticleItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
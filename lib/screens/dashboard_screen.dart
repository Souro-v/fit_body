import 'package:fit_body/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../widgets/app_image.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1025),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ─────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Madison',
                            style: TextStyle(
                              color: Color(0xFFB39DDB),
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "It's time to challenge your limits.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Search
                    IconButton(
                      onPressed: ()=> Navigator.pushNamed(context, AppRoutes.search),
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white70,
                        size: 24,
                      ),
                    ),
                    // Notification
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.notifications),
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.white70,
                        size: 24,
                      ),
                    ),
                    // Profile
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_outline,
                        color: Colors.white70,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Quick Access Icons ──────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _QuickIcon(
                      iconPath: 'assets/icons/ic_workout.png',
                      label: 'Workout',
                      onTap: () {},
                    ),
                    _Divider(),
                    _QuickIcon(
                      iconPath: 'assets/icons/ic_progress.png',
                      label: 'Progress\nTracking',
                      onTap: ()=> Navigator.pushNamed(context, AppRoutes.progressTracking),
                    ),
                    _Divider(),
                    _QuickIcon(
                      iconPath: 'assets/icons/ic_nutrition.png',
                      label: 'Nutrition',
                      onTap: ()  => Navigator.pushNamed(context, AppRoutes.nutrition),
                    ),
                    _Divider(),
                    _QuickIcon(
                      iconPath: 'assets/icons/ic_community.png',
                      label: 'Community',
                      onTap: () => Navigator.pushNamed(context, AppRoutes.community),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ── Recommendations ─────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      'Recommendations',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text(
                            'See All',
                            style: TextStyle(
                              color: Color(0xFFB39DDB),
                              fontSize: 13,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFB39DDB),
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Recommendation cards
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _WorkoutCard(
                      imagePath: 'assets/images/workout_thumb1.png',
                      title: 'Squat Exercise',
                      minutes: '12 Minutes',
                      kcal: '120 Kcal',
                    ),
                    const SizedBox(width: 12),
                    _WorkoutCard(
                      imagePath: 'assets/images/workout_thumb2.png',
                      title: 'Full Body Stretching',
                      minutes: '12 Minutes',
                      kcal: '120 Kcal',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── Weekly Challenge ────────────────────────────────────────
              Container(
                color: const Color(0xFFB39DDB).withValues(alpha: 0.25),
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 120,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AppBgImage(
                          assetPath: 'assets/images/weekly_challenge.png',
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withValues(alpha: 0.7),
                                Colors.transparent,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weekly\nChallenge',
                                style: TextStyle(
                                  color: Color(0xFFE8E44A),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  height: 1.2,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Plank With Hip Twist',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
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

              // ── Articles & Tips ─────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Articles & Tips',
                      style: TextStyle(
                        color: Color(0xFFB39DDB),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _ArticleCard(
                            imagePath: 'assets/images/article1.png',
                            title: 'Supplement Guide...',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _ArticleCard(
                            imagePath: 'assets/images/article2.png',
                            title: '15 Quick & Effective\nDaily Routines...',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),

      // ── Bottom Navigation ───────────────────────────────────────────────
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFFB39DDB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              iconPath: 'assets/icons/ic_nav_home.png',
              selected: _currentIndex == 0,
              onTap: () => setState(() => _currentIndex = 0),
            ),
            _NavItem(
              iconPath: 'assets/icons/ic_nav_workout.png',
              selected: _currentIndex == 1,
              onTap: () => setState(() => _currentIndex = 1),
            ),
            _NavItem(
              iconPath: 'assets/icons/ic_nav_favorite.png',
              selected: _currentIndex == 2,
              onTap: () => setState(() => _currentIndex = 2),
            ),
            _NavItem(
              iconPath: 'assets/icons/ic_nav_profile.png',
              selected: _currentIndex == 3,
              onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Widgets ────────────────────────────────────────────────────────────────

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 40, color: Colors.white24);
  }
}

class _QuickIcon extends StatelessWidget {
  const _QuickIcon({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  final String iconPath;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AppIconImage(assetPath: iconPath, size: 36, color: Colors.white),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  const _WorkoutCard({
    required this.imagePath,
    required this.title,
    required this.minutes,
    required this.kcal,
  });

  final String imagePath;
  final String title;
  final String minutes;
  final String kcal;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 160,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppBgImage(assetPath: imagePath),
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
            // Star
            const Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.star_border, color: Colors.white, size: 20),
            ),
            // Play button
            const Positioned(
              bottom: 52,
              right: 8,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xFFB39DDB),
                child: Icon(Icons.play_arrow, color: Colors.white, size: 16),
              ),
            ),
            // Info
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Color(0xFFB39DDB),
                          size: 12,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          minutes,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.local_fire_department,
                          color: Color(0xFFB39DDB),
                          size: 12,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          kcal,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  const _ArticleCard({required this.imagePath, required this.title});

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 110,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppBgImage(assetPath: imagePath),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.star_border, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });

  final String iconPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withValues(alpha: 0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AppIconImage(
          assetPath: iconPath,
          size: 26,
          color: selected ? Colors.white : Colors.white70,
        ),
      ),
    );
  }
}

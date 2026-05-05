// lib/screens/favorites_screen.dart

import 'package:flutter/material.dart';
import '../../widgets/app_image.dart';
import '../../widgets/app_widgets.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int _currentIndex = 2;
  String _selectedFilter = 'All';

  final _filters = ['All', 'Video', 'Article'];

  // ── Data ────────────────────────────────────────────────────────────────────
  final _videos = [
    _FavItem(
      title: 'Upper Body',
      image: 'assets/images/fav_upper_body.png',
      minutes: '60 Minutes',
      kcal: '1320 Kcal',
      exercises: '5 Exercises',
      isVideo: true,
    ),
    _FavItem(
      title: 'Pull Out',
      image: 'assets/images/fav_pull_out.png',
      minutes: '30 Minutes',
      kcal: '1210 Kcal',
      exercises: '10 Exercises',
      isVideo: true,
    ),
    _FavItem(
      title: 'Loop Band Exercises',
      image: 'assets/images/fav_loop_band.png',
      minutes: '45 Minutes',
      kcal: '785 Kcal',
      exercises: '5 Exercises',
      isVideo: true,
    ),
    _FavItem(
      title: 'Dumbbell Step Up',
      image: 'assets/images/fav_dumbbell_step.png',
      minutes: '12 Minutes',
      kcal: '1385 Kcal',
      exercises: '3 Exercises',
      isVideo: true,
    ),
    _FavItem(
      title: 'Split Strength Training',
      image: 'assets/images/fav_split_strength.png',
      minutes: '12 Minutes',
      kcal: '1250 Kcal',
      exercises: '5 Exercises',
      isVideo: true,
    ),
  ];

  final _articles = [
    _FavItem(
      title: 'Boost Energy And Vitality',
      image: 'assets/images/fav_boost_energy.png',
      subtitle: 'Incorporating physical exercise into your daily routine can boost...',
      minutes: '15 Minutes',
      kcal: '150 Cal',
      isVideo: false,
    ),
    _FavItem(
      title: 'Avocado And Egg Toast',
      image: 'assets/images/fav_avocado_toast.png',
      minutes: '15 Minutes',
      kcal: '150 Cal',
      isVideo: false,
    ),
    _FavItem(
      title: 'Lower Body Blast',
      image: 'assets/images/fav_lower_body.png',
      subtitle: 'A lower body blast is a high-intensity workout focused on targeting...',
      minutes: '12 Minutes',
      kcal: '120 Cal',
      isVideo: false,
    ),
    _FavItem(
      title: 'Fruit Smoothie',
      image: 'assets/images/fav_smoothie.png',
      minutes: '12 Minutes',
      kcal: '120 Cal',
      isVideo: false,
    ),
    _FavItem(
      title: 'Hydrate Properly',
      image: 'assets/images/fav_hydrate.png',
      subtitle: 'Stay hydrated before, during, and after your workouts to optimize...',
      minutes: '12 Minutes',
      kcal: '120 Cal',
      isVideo: false,
    ),
  ];

  List<_FavItem> get _filteredItems {
    if (_selectedFilter == 'Video') return _videos;
    if (_selectedFilter == 'Article') return _articles;
    return [..._videos, ..._articles];
  }

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
                  const Text('Favorites',
                      style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search,
                        color: Colors.white70, size: 22),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.white70, size: 22),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_outline,
                        color: Colors.white70, size: 22),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ── Filter tabs ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text('Sort By',
                      style: TextStyle(color: Colors.white70, fontSize: 13)),
                  const SizedBox(width: 12),
                  ..._filters.map((f) {
                    final selected = _selectedFilter == f;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedFilter = f),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColors.yellow
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selected
                                ? AppColors.yellow
                                : Colors.white24,
                          ),
                        ),
                        child: Text(f,
                            style: TextStyle(
                              color: selected
                                  ? Colors.black
                                  : Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── List ─────────────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return _FavCard(item: item);
                },
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

// ── Data model ─────────────────────────────────────────────────────────────────
class _FavItem {
  final String title;
  final String image;
  final String? subtitle;
  final String minutes;
  final String kcal;
  final String? exercises;
  final bool isVideo;

  _FavItem({
    required this.title,
    required this.image,
    this.subtitle,
    required this.minutes,
    required this.kcal,
    this.exercises,
    required this.isVideo,
  });
}

// ── Card widget ────────────────────────────────────────────────────────────────
class _FavCard extends StatefulWidget {
  const _FavCard({required this.item});
  final _FavItem item;

  @override
  State<_FavCard> createState() => _FavCardState();
}

class _FavCardState extends State<_FavCard> {
  bool _starred = true;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                if (item.subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(item.subtitle!,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 11, height: 1.4)),
                ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        color: AppColors.purple, size: 12),
                    const SizedBox(width: 3),
                    Text(item.minutes,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(Icons.local_fire_department,
                        color: AppColors.purple, size: 12),
                    const SizedBox(width: 3),
                    Text(item.kcal,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 11)),
                  ],
                ),
                if (item.exercises != null) ...[
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(Icons.fitness_center,
                          color: AppColors.purple, size: 12),
                      const SizedBox(width: 3),
                      Text(item.exercises!,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 11)),
                    ],
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Image section
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 110,
              height: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppBgImage(assetPath: item.image),
                  // Star
                  Positioned(
                    top: 6,
                    right: 6,
                    child: GestureDetector(
                      onTap: () => setState(() => _starred = !_starred),
                      child: Icon(
                        _starred ? Icons.star : Icons.star_border,
                        color: _starred
                            ? AppColors.yellow
                            : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  // Play button (video only)
                  if (item.isVideo)
                    const Center(
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.purple,
                        child: Icon(Icons.play_arrow,
                            color: Colors.white, size: 18),
                      ),
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
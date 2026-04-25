
import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../routes/app_routes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentIndex = 1;
  String _selectedTab = 'All';
  final _searchCtrl = TextEditingController();

  final _tabs = ['All', 'Workout', 'Nutrition'];

  final _workoutTopSearches = [
    'Circuit', 'Split', 'Challenge', 'Legs', 'Cardio'
  ];

  final _nutritionTopSearches = [
    'Breakfast', 'Yogurt', 'Vegetarian', 'Smoothie', 'Chicken'
  ];

  final _allItems = [
    _SearchItem(
      image: 'assets/images/workout_thumb1.png',
      title: 'Squat Exercise',
      minutes: '12 Minutes',
      kcal: '120 Kcal',
      isVideo: true,
    ),
    _SearchItem(
      image: 'assets/images/workout_thumb2.png',
      title: 'Full Body Stretching',
      minutes: '12 Minutes',
      kcal: '120 Kcal',
      isVideo: true,
    ),
    _SearchItem(
      image: 'assets/images/fav_pull_out.png',
      title: 'Circuit Training',
      minutes: '50 Minutes',
      kcal: '1300 Kcal',
      exercises: '5 Exercises',
      isVideo: false,
    ),
    _SearchItem(
      image: 'assets/images/search_yogurt.png',
      title: 'Delights With Greek Yogurt',
      minutes: '6 Minutes',
      kcal: '200 Cal',
      isVideo: false,
    ),
    _SearchItem(
      image: 'assets/images/fav_split_strength.png',
      title: 'Split Strength Training',
      minutes: '12 Minutes',
      kcal: '1250 Kcal',
      exercises: '5 Exercises',
      isVideo: false,
    ),
    _SearchItem(
      image: 'assets/images/search_turkey.png',
      title: 'Turkey And Avocado Wrap',
      minutes: '12 Minutes',
      kcal: '200 Cal',
      isVideo: false,
    ),
  ];

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
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
                  const Text('Search',
                      style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  const Spacer(),
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

            // ── Search bar ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchCtrl,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.black38),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search,
                      color: Colors.black38, size: 20),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ── Filter tabs ──────────────────────────────────────────────
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

            // ── Content ──────────────────────────────────────────────────
            Expanded(
              child: _selectedTab == 'All'
                  ? _AllContent(items: _allItems)
                  : _TopSearchContent(
                searches: _selectedTab == 'Workout'
                    ? _workoutTopSearches
                    : _nutritionTopSearches,
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

// ── All tab content ────────────────────────────────────────────────────────────
class _AllContent extends StatelessWidget {
  const _AllContent({required this.items});
  final List<_SearchItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        // Top 2 video cards horizontal
        SizedBox(
          height: 160,
          child: Row(
            children: items
                .where((i) => i.isVideo)
                .take(2)
                .map((item) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
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
                        child: Icon(Icons.star_border,
                            color: Colors.white, size: 18),
                      ),
                      const Positioned(
                        bottom: 40,
                        right: 8,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: AppColors.purple,
                          child: Icon(Icons.play_arrow,
                              color: Colors.white, size: 15),
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
                                    fontWeight: FontWeight.w600)),
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
                                Text(item.kcal,
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
              ),
            ))
                .toList(),
          ),
        ),

        const SizedBox(height: 12),

        // List items
        ...items.where((i) => !i.isVideo).map((item) => _ListCard(item: item)),

        const SizedBox(height: 20),
      ],
    );
  }
}

// ── Top Searches content ───────────────────────────────────────────────────────
class _TopSearchContent extends StatelessWidget {
  const _TopSearchContent({required this.searches});
  final List<String> searches;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Text('Top Searches',
            style: TextStyle(
                color: AppColors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 16),
        ...searches.map((s) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.yellow,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.search,
                    color: Colors.black, size: 18),
              ),
              const SizedBox(width: 14),
              Text(s,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        )),
        const SizedBox(height: 20),
      ],
    );
  }
}

// ── List card (non-video) ──────────────────────────────────────────────────────
class _ListCard extends StatelessWidget {
  const _ListCard({required this.item});
  final _SearchItem item;

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
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
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
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 100,
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

// ── Model ──────────────────────────────────────────────────────────────────────
class _SearchItem {
  final String image;
  final String title;
  final String minutes;
  final String kcal;
  final String? exercises;
  final bool isVideo;

  _SearchItem({
    required this.image,
    required this.title,
    required this.minutes,
    required this.kcal,
    this.exercises,
    required this.isVideo,
  });
}
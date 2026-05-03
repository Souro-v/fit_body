import 'package:fit_body/constants/app_assets.dart';
import 'package:flutter/material.dart';
import '../widgets/app_image.dart';
import '../widgets/app_widgets.dart';
import '../models/user_data.dart';
import '../routes/app_routes.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _currentIndex = 1;
  String _selectedTab = 'Discussion Forum';
  final _user = UserData();

  final _forums = [
    _ForumItem(
      title: 'Strength Training Techniques',
      subtitle: 'Discussion on training methods',
      time: 'Today 17:05',
    ),
    _ForumItem(
      title: 'Nutrition and Diet Strategies',
      subtitle: 'Meal planning, supplementation preferences',
      time: 'Today 17:05',
    ),
    _ForumItem(
      title: 'Cardiovascular Fitness',
      subtitle: 'About different types of cardio workouts',
      time: 'Today 17:05',
    ),
    _ForumItem(
      title: 'Strength Training Techniques',
      subtitle: 'Strategies for improving flexibility and joint mobility to prevent injuries',
      time: 'Today 17:05',
    ),
  ];

  final _discussions = [
    _DiscussionItem(
      text: 'Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse pretium nunc non facilisi.',
      likes: '30,254',
      comments: '12,254',
      views: '1,254',
    ),
    _DiscussionItem(
      text: 'Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse pretium nunc non facilisi.',
      likes: '30,254',
      comments: '12,254',
      views: '1,254',
    ),
    _DiscussionItem(
      text: 'Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse pretium nunc non facilisi.',
      likes: '30,254',
      comments: '12,254',
      views: '1,254',
    ),
    _DiscussionItem(
      text: 'Lorem ipsum dolor sit amet consectetur. Tortor aenean suspendisse pretium nunc non facilisi.',
      likes: '30,254',
      comments: '12,254',
      views: '1,254',
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
                  const Text('Community',
                      style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  const Spacer(),
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.search),
                    icon: const Icon(Icons.search, color: Colors.white70),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(
                        context, AppRoutes.notifications),
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.white70),
                  ),
                  IconButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.profile),
                    icon: const Icon(Icons.person_outline,
                        color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ── Tabs ─────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: ['Discussion Forum', 'Challenges'].map((tab) {
                  final selected = _selectedTab == tab;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = tab),
                      child: Container(
                        margin: EdgeInsets.only(
                            right: tab == 'Discussion Forum' ? 8 : 0),
                        height: 44,
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColors.yellow
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: selected
                                  ? AppColors.yellow
                                  : Colors.white24),
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
              child: _selectedTab == 'Discussion Forum'
                  ? _DiscussionForumContent(
                banner: AppAssets.workoutCardio,
                forums: _forums,
                discussions: _discussions,
                user: _user,
              )
                  : const _ChallengesContent(),
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

// ── Discussion Forum content ───────────────────────────────────────────────────
class _DiscussionForumContent extends StatelessWidget {
  const _DiscussionForumContent({
    required this.banner,
    required this.forums,
    required this.discussions,
    required this.user,
  });

  final String banner;
  final List<_ForumItem> forums;
  final List<_DiscussionItem> discussions;
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        // Banner
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppBgImage(assetPath: banner),
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
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cycling Challenge',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.access_time,
                              color: AppColors.purple, size: 12),
                          SizedBox(width: 3),
                          Text('15 Minutes',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 11)),
                          SizedBox(width: 10),
                          Icon(Icons.local_fire_department,
                              color: AppColors.purple, size: 12),
                          SizedBox(width: 3),
                          Text('100 Kcal',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 11)),
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

        const SizedBox(height: 20),

        const Text('Forums',
            style: TextStyle(
                color: AppColors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.w700)),

        const SizedBox(height: 12),

        // Forums list
        ...forums.map((f) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(
              horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.purple.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(f.title,
                        style: const TextStyle(
                            color: AppColors.yellow,
                            fontSize: 13,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 3),
                    Text(f.subtitle,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 11)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('See All',
                      style: TextStyle(
                          color: AppColors.yellow, fontSize: 11)),
                  const SizedBox(height: 3),
                  Text(f.time,
                      style: const TextStyle(
                          color: Colors.white54, fontSize: 10)),
                ],
              ),
            ],
          ),
        )),

        const SizedBox(height: 20),

        // Discussions
        ...discussions.map((item) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: AppColors.purple.withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.purple,
                    backgroundImage: user.profilePhoto != null
                        ? FileImage(user.profilePhoto!)
                        : const AssetImage(
                        'assets/images/profile_photo.png')
                    as ImageProvider,
                  ),
                  const SizedBox(width: 10),
                  Text(user.name.split(' ').first,
                      style: const TextStyle(
                          color: AppColors.yellow,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  const Spacer(),
                  const Icon(Icons.star_border,
                      color: Colors.white54, size: 18),
                ],
              ),
              const SizedBox(height: 10),
              Text(item.text,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.5)),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star_border,
                      color: Colors.white54, size: 14),
                  const SizedBox(width: 4),
                  Text(item.likes,
                      style: const TextStyle(
                          color: Colors.white54, fontSize: 11)),
                  const SizedBox(width: 16),
                  const Icon(Icons.chat_bubble_outline,
                      color: Colors.white54, size: 14),
                  const SizedBox(width: 4),
                  Text(item.comments,
                      style: const TextStyle(
                          color: Colors.white54, fontSize: 11)),
                  const SizedBox(width: 16),
                  const Icon(Icons.visibility_outlined,
                      color: Colors.white54, size: 14),
                  const SizedBox(width: 4),
                  Text(item.views,
                      style: const TextStyle(
                          color: Colors.white54, fontSize: 11)),
                ],
              ),
            ],
          ),
        )),

        const SizedBox(height: 20),
      ],
    );
  }
}

// ── Challenges content ─────────────────────────────────────────────────────────
class _ChallengesContent extends StatelessWidget {
  const _ChallengesContent();

  static const _challenges = [
    _ChallengeItem(
      image: 'assets/images/workout_cardio.png',
      title: 'Cycling Challenge',
      description:
      'Lorem Ipsum Dolor Sit Amet Consectetur Magnis Pellentesque Felis Ullamcorper Imperdiet.',
    ),
    _ChallengeItem(
      image: 'assets/images/challenge_power_squat.png',
      title: 'Power Squat',
      description:
      'Lorem Ipsum Dolor Sit Amet Consectetur Magnis Pellentesque Felis Ullamcorper Imperdiet.',
    ),
    _ChallengeItem(
      image: 'assets/images/fav_lower_body.png',
      title: 'Press Leg Ultimate',
      description:
      'Lorem Ipsum Dolor Sit Amet Consectetur Magnis Pellentesque Felis Ullamcorper Imperdiet.',
    ),
    _ChallengeItem(
      image: 'assets/images/workout_cardio.png',
      title: 'Cycling',
      description:
      'Lorem Ipsum Dolor Sit Amet Consectetur Magnis Pellentesque Felis Ullamcorper Imperdiet.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Text('Challenges And Competitions',
            style: TextStyle(
                color: AppColors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.w700)),

        const SizedBox(height: 16),

        ..._challenges.map((item) => GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.challengeDetail,
            arguments: item,
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.card,
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
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text(item.description,
                          style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                              height: 1.4)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 100,
                    height: 90,
                    child: AppBgImage(assetPath: item.image),
                  ),
                ),
              ],
            ),
          ),
        )),

        const SizedBox(height: 20),
      ],
    );
  }
}

// ── Models ─────────────────────────────────────────────────────────────────────
class _ForumItem {
  final String title;
  final String subtitle;
  final String time;

  _ForumItem({
    required this.title,
    required this.subtitle,
    required this.time,
  });
}

class _DiscussionItem {
  final String text;
  final String likes;
  final String comments;
  final String views;

  _DiscussionItem({
    required this.text,
    required this.likes,
    required this.comments,
    required this.views,
  });
}

class _ChallengeItem {
  final String image;
  final String title;
  final String description;

  const _ChallengeItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
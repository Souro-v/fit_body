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
  ];

  final _discussions = [
    _DiscussionItem(
      text: 'Lorem ipsum dolor sit amet consectetur.',
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
            // Top Bar
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
                    icon:
                    const Icon(Icons.notifications_none, color: Colors.white70),
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

            // Tabs
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
                                color:
                                selected ? Colors.black : Colors.white70,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

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

//////////////////// Discussion ////////////////////

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
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 200,
            child: AppBgImage(assetPath: banner),
          ),
        ),

        const SizedBox(height: 20),

        const Text('Forums',
            style: TextStyle(
                color: AppColors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.w700)),

        const SizedBox(height: 12),

        ...forums.map((f) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.purple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(f.title,
              style: const TextStyle(color: Colors.white)),
        )),

        const SizedBox(height: 20),
      ],
    );
  }
}

//////////////////// Challenges ////////////////////

class _ChallengesContent extends StatelessWidget {
  const _ChallengesContent({super.key});

  final List<_ChallengeItem> _challenges = const [
    _ChallengeItem(
      image: 'assets/images/workout_cardio.png',
      title: 'Cycling Challenge',
      description: 'Lorem Ipsum Dolor Sit Amet.',
    ),
    _ChallengeItem(
      image: 'assets/images/challenge_power_squat.png',
      title: 'Power Squat',
      description: 'Lorem Ipsum Dolor Sit Amet.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Text('Challenges',
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
                  child: Text(item.title,
                      style: const TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: AppBgImage(assetPath: item.image),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}

//////////////////// Models ////////////////////

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
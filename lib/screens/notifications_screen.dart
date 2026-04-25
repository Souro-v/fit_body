// lib/screens/notifications_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _currentIndex = 3;
  String _selectedTab = 'Reminders';

  // ── Reminders data ────────────────────────────────────────────────────────
  final _reminders = [
    _NotifGroup(date: 'Today', items: [
      _NotifItem(
        icon: Icons.star_outline,
        bgColor: Color(0xFFB39DDB),
        title: 'New Workout Is Available',
        time: 'June 10 - 10:00 AM',
      ),
      _NotifItem(
        icon: Icons.lightbulb_outline,
        bgColor: Color(0xFFE8E44A),
        title: "Don't Forget To Drink Water",
        time: 'June 10 - 8:00 AM',
      ),
    ]),
    _NotifGroup(date: 'Yesterday', items: [
      _NotifItem(
        icon: Icons.emoji_events_outlined,
        bgColor: Color(0xFFE8E44A),
        title: 'Upper Body Workout Completed!',
        time: 'June 09 - 6:00 PM',
      ),
      _NotifItem(
        icon: Icons.lightbulb_outline,
        bgColor: Color(0xFFB39DDB),
        title: 'Remember Your Exercise Session',
        time: 'June 09 - 3:00 PM',
      ),
      _NotifItem(
        icon: Icons.article_outlined,
        bgColor: Color(0xFFB39DDB),
        title: 'New Article & Tip Posted!',
        time: 'June 09 - 11:00 AM',
      ),
    ]),
    _NotifGroup(date: 'May 29 - 20XX', items: [
      _NotifItem(
        icon: Icons.star_outline,
        bgColor: Color(0xFFB39DDB),
        title: 'You Started A New Challenge!',
        time: 'May 29 - 9:00 AM',
      ),
      _NotifItem(
        icon: Icons.star_outline,
        bgColor: Color(0xFFB39DDB),
        title: 'New House Training Ideas!',
        time: 'May 29 - 8:20 AM',
      ),
    ]),
  ];

  // ── System data ───────────────────────────────────────────────────────────
  final _system = [
    _NotifGroup(date: 'Today', items: [
      _NotifItem(
        icon: Icons.star_outline,
        bgColor: Color(0xFFE8E44A),
        title: 'You Have A New Message!',
        time: 'June 10 - 2:00 PM',
      ),
      _NotifItem(
        icon: Icons.article_outlined,
        bgColor: Color(0xFFB39DDB),
        title: 'Scheduled Maintenance.',
        time: 'June 10 - 8:00 AM',
      ),
      _NotifItem(
        icon: Icons.notifications_outlined,
        bgColor: Color(0xFFB39DDB),
        title: 'We\'ve Detected A Login From A New Device',
        time: 'June 10 - 5:00 AM',
      ),
    ]),
    _NotifGroup(date: 'Yesterday', items: [
      _NotifItem(
        icon: Icons.article_outlined,
        bgColor: Color(0xFFB39DDB),
        title: 'We\'ve Updated Our Privacy Policy',
        time: 'June 09 - 1:00 PM',
      ),
      _NotifItem(
        icon: Icons.star_outline,
        bgColor: Color(0xFFB39DDB),
        title: 'You Have A New Message!',
        time: 'June 09 - 9:00 AM',
      ),
    ]),
    _NotifGroup(date: 'May 29 - 20XX', items: [
      _NotifItem(
        icon: Icons.star_outline,
        bgColor: Color(0xFFB39DDB),
        title: 'You Have A New Message!',
        time: 'May 29 - 10:00 AM',
      ),
      _NotifItem(
        icon: Icons.article_outlined,
        bgColor: Color(0xFFB39DDB),
        title: "We've Made Changes To Our Terms Of Service",
        time: 'May 29 - 7:20 AM',
      ),
    ]),
  ];

  List<_NotifGroup> get _currentData =>
      _selectedTab == 'Reminders' ? _reminders : _system;

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
                  const Text('Notifications',
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

            const SizedBox(height: 16),

            // ── Tabs ─────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: ['Reminders', 'System'].map((tab) {
                  final selected = _selectedTab == tab;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = tab),
                      child: Container(
                        margin: EdgeInsets.only(
                            right: tab == 'Reminders' ? 8 : 0),
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

            // ── List ─────────────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _currentData.length,
                itemBuilder: (context, groupIndex) {
                  final group = _currentData[groupIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date header
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(group.date,
                            style: const TextStyle(
                                color: AppColors.yellow,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      ),
                      // Items
                      ...group.items.map((item) => _NotifCard(item: item)),
                    ],
                  );
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

// ── Models ─────────────────────────────────────────────────────────────────────
class _NotifGroup {
  final String date;
  final List<_NotifItem> items;
  _NotifGroup({required this.date, required this.items});
}

class _NotifItem {
  final IconData icon;
  final Color bgColor;
  final String title;
  final String time;
  _NotifItem({
    required this.icon,
    required this.bgColor,
    required this.title,
    required this.time,
  });
}

// ── Card ───────────────────────────────────────────────────────────────────────
class _NotifCard extends StatelessWidget {
  const _NotifCard({required this.item});
  final _NotifItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          // Icon circle
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: item.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: Colors.black, size: 22),
          ),
          const SizedBox(width: 12),
          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(item.time,
                    style: const TextStyle(
                        color: Colors.black54, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
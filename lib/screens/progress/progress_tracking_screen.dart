// lib/screens/progress_tracking_screen.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/app_widgets.dart';
import '../../models/user_data.dart';
import '../../routes/app_routes.dart';

class ProgressTrackingScreen extends StatefulWidget {
  const ProgressTrackingScreen({super.key});

  @override
  State<ProgressTrackingScreen> createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {
  int _currentIndex = 1;
  String _selectedTab = 'Workout';
  DateTime _selectedDate = DateTime(2024, 1, 9);
  String _selectedPeriod = 'Month';
  final _user = UserData();

  final _activities = [
    _Activity(
      kcal: '120 Kcal',
      title: 'Upper Body Workout',
      date: 'June 09',
      duration: '25 Mins',
    ),
    _Activity(
      kcal: '130 Kcal',
      title: 'Pull Out',
      date: 'April 15 - 4:00 PM',
      duration: '30 Mins',
    ),
  ];

  final _progressData = [
    _ProgressItem(day: 'Thu', date: '14', steps: '3,679', duration: '1hr40m'),
    _ProgressItem(day: 'Wen', date: '20', steps: '5,789', duration: '1hr20m'),
    _ProgressItem(day: 'Sat', date: '22', steps: '1,859', duration: '1hr10m'),
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
                  const Text('Progress Tracking',
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

            // ── Profile header ───────────────────────────────────────────
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.purple.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(_user.name.split(' ').first,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(width: 6),
                            const Icon(Icons.female,
                                color: Colors.white70, size: 18),
                          ],
                        ),
                        Text('Age: ${_user.age}',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 12)),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _StatBadge(
                                label: _user.weight, sub: 'Weight'),
                            const SizedBox(width: 12),
                            _StatBadge(
                                label: _user.height, sub: 'Height'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Profile photo
                  CircleAvatar(
                    radius: 44,
                    backgroundColor: AppColors.card,
                    backgroundImage: _user.profilePhoto != null
                        ? FileImage(_user.profilePhoto!)
                        : const AssetImage('assets/images/profile_photo.png')
                    as ImageProvider,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Workout / Charts tabs ────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: ['Workout', 'Charts'].map((tab) {
                  final selected = _selectedTab == tab;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = tab),
                      child: Container(
                        margin: EdgeInsets.only(
                            right: tab == 'Workout' ? 8 : 0),
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
              child: _selectedTab == 'Workout'
                  ? _WorkoutLogContent(
                selectedDate: _selectedDate,
                selectedPeriod: _selectedPeriod,
                activities: _activities,
                onDateSelected: (date) =>
                    setState(() => _selectedDate = date),
                onPeriodChanged: (period) =>
                    setState(() => _selectedPeriod = period),
              )
                  : _ChartsContent(progressData: _progressData),
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

// ── Workout Log content ────────────────────────────────────────────────────────
class _WorkoutLogContent extends StatelessWidget {
  const _WorkoutLogContent({
    required this.selectedDate,
    required this.selectedPeriod,
    required this.activities,
    required this.onDateSelected,
    required this.onPeriodChanged,
  });

  final DateTime selectedDate;
  final String selectedPeriod;
  final List<_Activity> activities;
  final Function(DateTime) onDateSelected;
  final Function(String) onPeriodChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        // Choose Date + Month
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Choose Date',
                style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(selectedPeriod,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13)),
                  const Icon(Icons.keyboard_arrow_down,
                      color: Colors.white70, size: 20),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Calendar
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: _CalendarWidget(
            selectedDate: selectedDate,
            onDateSelected: onDateSelected,
          ),
        ),

        const SizedBox(height: 20),

        // Activities
        const Text('Activities',
            style: TextStyle(
                color: AppColors.yellow,
                fontSize: 16,
                fontWeight: FontWeight.w700)),

        const SizedBox(height: 12),

        ...activities.map((a) => _ActivityCard(activity: a)),

        const SizedBox(height: 20),
      ],
    );
  }
}

// ── Calendar widget ────────────────────────────────────────────────────────────
class _CalendarWidget extends StatelessWidget {
  const _CalendarWidget({
    required this.selectedDate,
    required this.onDateSelected,
  });

  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    final daysOfWeek = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    final firstDay = DateTime(selectedDate.year, selectedDate.month, 1);
    final daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    final startWeekday = firstDay.weekday - 1;

    return Column(
      children: [
        // Days of week
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: daysOfWeek
              .map((d) => Text(d,
              style: const TextStyle(
                  color: AppColors.purple,
                  fontSize: 11,
                  fontWeight: FontWeight.w600)))
              .toList(),
        ),
        const SizedBox(height: 8),
        // Days grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
          ),
          itemCount: startWeekday + daysInMonth,
          itemBuilder: (context, index) {
            if (index < startWeekday) return const SizedBox();
            final day = index - startWeekday + 1;
            final date =
            DateTime(selectedDate.year, selectedDate.month, day);
            final isSelected = date.day == selectedDate.day;
            return GestureDetector(
              onTap: () => onDateSelected(date),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.yellow : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text('$day',
                    style: TextStyle(
                        color:
                        isSelected ? Colors.black : Colors.black87,
                        fontSize: 12,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w400)),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ── Activity card ──────────────────────────────────────────────────────────────
class _ActivityCard extends StatelessWidget {
  const _ActivityCard({required this.activity});
  final _Activity activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: AppColors.purple,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.directions_run,
                color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity.kcal,
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 11)),
                Text(activity.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                Text(activity.date,
                    style: const TextStyle(
                        color: Colors.white54, fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Duration',
                  style: TextStyle(
                      color: AppColors.purple, fontSize: 11)),
              Row(
                children: [
                  const Icon(Icons.access_time,
                      color: AppColors.purple, size: 12),
                  const SizedBox(width: 3),
                  Text(activity.duration,
                      style: const TextStyle(
                          color: AppColors.purple,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Charts content ─────────────────────────────────────────────────────────────
class _ChartsContent extends StatelessWidget {
  const _ChartsContent({required this.progressData});
  final List<_ProgressItem> progressData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Text('My Progress',
            style: TextStyle(color: Colors.white70, fontSize: 13)),
        const Text('January 12th',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800)),

        const SizedBox(height: 16),

        // Bar chart
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Steps',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              SizedBox(
                height: 160,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 175,
                    minY: 148,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const months = [
                              'Jan', 'Feb', 'Mar', 'Apr'
                            ];
                            return Text(
                              months[value.toInt()],
                              style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 32,
                          getTitlesWidget: (value, meta) => Text(
                            '${value.toInt()}',
                            style: const TextStyle(
                                color: Colors.white54, fontSize: 10),
                          ),
                        ),
                      ),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.white12,
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      _barGroup(0, 168, 172),
                      _barGroup(1, 162, 168),
                      _barGroup(2, 158, 172),
                      _barGroup(3, 155, 165),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Progress list
        ...progressData.map((item) => _ProgressCard(item: item)),

        const SizedBox(height: 20),
      ],
    );
  }

  BarChartGroupData _barGroup(int x, double gray, double yellow) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: gray,
          color: Colors.white24,
          width: 20,
          borderRadius: BorderRadius.circular(4),
        ),
        BarChartRodData(
          toY: yellow,
          color: AppColors.yellow,
          width: 20,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}

// ── Progress card ──────────────────────────────────────────────────────────────
class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.item});
  final _ProgressItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.purple.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Day + date
          Column(
            children: [
              Text(item.day,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 12)),
              Text(item.date,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 1,
            height: 40,
            color: Colors.white24,
          ),
          // Steps
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Steps',
                    style:
                    TextStyle(color: Colors.white70, fontSize: 11)),
                Text(item.steps,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          // Duration
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Duration',
                  style:
                  TextStyle(color: Colors.white70, fontSize: 11)),
              Row(
                children: [
                  const Icon(Icons.access_time,
                      color: Colors.white70, size: 12),
                  const SizedBox(width: 3),
                  Text(item.duration,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Stat badge ─────────────────────────────────────────────────────────────────
class _StatBadge extends StatelessWidget {
  const _StatBadge({required this.label, required this.sub});
  final String label;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700)),
          Text(sub,
              style: const TextStyle(
                  color: Colors.black54, fontSize: 10)),
        ],
      ),
    );
  }
}

// ── Models ─────────────────────────────────────────────────────────────────────
class _Activity {
  final String kcal;
  final String title;
  final String date;
  final String duration;
  _Activity({
    required this.kcal,
    required this.title,
    required this.date,
    required this.duration,
  });
}

class _ProgressItem {
  final String day;
  final String date;
  final String steps;
  final String duration;
  _ProgressItem({
    required this.day,
    required this.date,
    required this.steps,
    required this.duration,
  });
}
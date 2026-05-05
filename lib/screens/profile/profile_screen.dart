// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import '../../models/user_data.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _user = UserData();
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // ── Purple header ──────────────────────────────────────────────
          Container(
            color: AppColors.purple.withValues(alpha: 0.4),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_ios,
                                color: AppColors.yellow, size: 14),
                            Text('My Profile',
                                style: TextStyle(
                                    color: AppColors.yellow,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Profile photo
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: AppColors.card,
                    backgroundImage: _user.profilePhoto != null
                        ? FileImage(_user.profilePhoto!)
                        : const AssetImage('assets/images/profile_photo.png')
                    as ImageProvider,
                  ),

                  const SizedBox(height: 12),

                  // Name & email
                  Text(_user.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text(_user.email,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('Birthday: April 1st',
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 12)),

                  const SizedBox(height: 16),

                  // Stats bar
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.purple.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        _StatItem(label: 'Weight', value: _user.weight),
                        _Divider(),
                        _StatItem(label: 'Years Old', value: '${_user.age}'),
                        _Divider(),
                        _StatItem(label: 'Height', value: _user.height),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // ── Menu list ──────────────────────────────────────────────────
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              children: [
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  label: 'Profile',
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.editProfile),
                ),
                ProfileMenuItem(
                  icon: Icons.star_outline,
                  label: 'Favorite',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.favorites),
                ),
                ProfileMenuItem(
                  icon: Icons.lock_outline,
                  label: 'Privacy Policy',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.settings),
                ),
                ProfileMenuItem(
                  icon: Icons.help_outline,
                  label: 'Help',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.help),
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () => _showLogoutDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFFD4C5F9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure you want to\nlog out?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const Text('Cancel',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                          (route) => false,
                    ),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const Text('Yes, logout',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(
                  color: Colors.white70, fontSize: 11)),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 30, color: Colors.white24);
  }
}
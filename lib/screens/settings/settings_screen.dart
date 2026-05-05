import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';
import '../../routes/app_routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back_ios,
                        color: AppColors.yellow, size: 14),
                    Text('Settings',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _SettingsMenuItem(
                    icon: Icons.notifications_outlined,
                    label: 'Notification Setting',
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.notificationSettings),
                  ),
                  _SettingsMenuItem(
                    icon: Icons.lock_outline,
                    label: 'Password Setting',
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.passwordSettings),
                  ),
                  _SettingsMenuItem(
                    icon: Icons.person_remove_outlined,
                    label: 'Delete Account',
                    onTap: () => _showDeleteDialog(context),
                  ),
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

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.card,
        title: const Text('Delete Account',
            style: TextStyle(color: Colors.white)),
        content: const Text(
            'Are you sure you want to delete your account? This cannot be undone.',
            style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(color: AppColors.purple)),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(
                context, AppRoutes.login),
            child: const Text('Delete',
                style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _SettingsMenuItem extends StatelessWidget {
  const _SettingsMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.purple.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 16),
            Text(label,
                style: const TextStyle(
                    color: Colors.white, fontSize: 15)),
            const Spacer(),
            const Icon(Icons.arrow_drop_down,
                color: AppColors.yellow, size: 24),
          ],
        ),
      ),
    );
  }
}
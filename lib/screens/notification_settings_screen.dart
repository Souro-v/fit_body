// lib/screens/notification_settings_screen.dart

import 'package:flutter/material.dart';
import '../widgets/app_widgets.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  int _currentIndex = 3;

  bool _general  = true;
  bool _sound    = true;
  bool _disturb  = true;
  bool _vibrate  = true;
  bool _lock     = true;
  bool _reminder = true;

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
                    Text('Notifications Settings',
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _ToggleRow(
                    label: 'General Notification',
                    value: _general,
                    onChanged: (v) => setState(() => _general = v),
                  ),
                  _ToggleRow(
                    label: 'Sound',
                    value: _sound,
                    onChanged: (v) => setState(() => _sound = v),
                  ),
                  _ToggleRow(
                    label: "Don't Disturb Mode",
                    value: _disturb,
                    onChanged: (v) => setState(() => _disturb = v),
                  ),
                  _ToggleRow(
                    label: 'Vibrate',
                    value: _vibrate,
                    onChanged: (v) => setState(() => _vibrate = v),
                  ),
                  _ToggleRow(
                    label: 'Lock Screen',
                    value: _lock,
                    onChanged: (v) => setState(() => _lock = v),
                  ),
                  _ToggleRow(
                    label: 'Reminders',
                    value: _reminder,
                    onChanged: (v) => setState(() => _reminder = v),
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
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 15)),
          const Spacer(),
          AppToggle(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}
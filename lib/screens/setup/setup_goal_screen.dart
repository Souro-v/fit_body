
import 'package:fit_body/screens/setup/setup_widgets.dart';
import 'package:flutter/material.dart' hide BackButton;
import '../../routes/app_routes.dart';
class SetupGoalScreen extends StatefulWidget {
  const SetupGoalScreen({super.key});

  @override
  State<SetupGoalScreen> createState() => _SetupGoalScreenState();
}

class _SetupGoalScreenState extends State<SetupGoalScreen> {
  String? _selected;

  final _goals = [
    'Lose Weight',
    'Gain Weight',
    'Muscle Mass Gain',
    'Shape Body',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1025),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              SetupBackButton(),
              const SizedBox(height: 32),
              const Text('What Is Your Goal?',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.5),
              ),
              const SizedBox(height: 24),
              // Goals list
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFB39DDB).withOpacity(0.35),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: _goals.map((goal) {
                    final isSelected = _selected == goal;
                    return GestureDetector(
                      onTap: () => setState(() => _selected = goal),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1025),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Text(goal,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                            const Spacer(),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFFE8E44A)
                                      : Colors.white38,
                                  width: 2,
                                ),
                                color: isSelected
                                    ? const Color(0xFFE8E44A)
                                    : Colors.transparent,
                              ),
                              child: isSelected
                                  ? const Icon(Icons.check,
                                  color: Colors.black, size: 14)
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
              ContinueButton(
                onTap: _selected == null
                    ? null
                    : () => Navigator.pushNamed(context, AppRoutes.setupActivity),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
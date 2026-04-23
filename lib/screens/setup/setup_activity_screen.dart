
import 'package:fit_body/screens/setup/setup_widgets.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class SetupActivityScreen extends StatefulWidget {
  const SetupActivityScreen({super.key});

  @override
  State<SetupActivityScreen> createState() => _SetupActivityScreenState();
}

class _SetupActivityScreenState extends State<SetupActivityScreen> {
  String? _selected;

  final _levels = ['Beginner', 'Intermediate', 'Advance'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1025),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Align(alignment: Alignment.centerLeft, child: SetupBackButton()),
              const SizedBox(height: 32),
              const Text('Physical Activity Level',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.5),
              ),
              const Spacer(),
              // Level buttons
              ..._levels.map((level) {
                final isSelected = _selected == level;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () => setState(() => _selected = level),
                    child: Container(
                      height: 58,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFE8E44A)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        level,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.black
                              : const Color(0xFFB39DDB),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const Spacer(),
              ContinueButton(
                onTap: _selected == null
                    ? null
                    : () => Navigator.pushNamed(context, AppRoutes.setupProfile),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
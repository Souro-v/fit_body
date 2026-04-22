
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
class SetupGenderScreen extends StatefulWidget {
  const SetupGenderScreen({super.key});

  @override
  State<SetupGenderScreen> createState() => _SetupGenderScreenState();
}

class _SetupGenderScreenState extends State<SetupGenderScreen> {
  String? _selected;

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
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.white70, size: 16),
                    SizedBox(width: 4),
                    Text('Back', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text("What's Your Gender",
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFB39DDB).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.5),
                ),
              ),
              const SizedBox(height: 40),
              // Gender options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _GenderOption(
                    label: 'Male',
                    iconPath: 'assets/icons/ic_male.png',
                    selected: _selected == 'Male',
                    onTap: () => setState(() => _selected = 'Male'),
                  ),
                  _GenderOption(
                    label: 'Female',
                    iconPath: 'assets/icons/ic_female.png',
                    selected: _selected == 'Female',
                    onTap: () => setState(() => _selected = 'Female'),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: _selected == null
                    ? null
                    : () => Navigator.pushNamed(context, AppRoutes.setupAge),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _selected == null
                        ? const Color(0xFF2D2D2D).withOpacity(0.5)
                        : const Color(0xFF2D2D2D),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white12),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Continue',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.label,
    required this.iconPath,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: selected ? const Color(0xFFE8E44A) : const Color(0xFF2A1F3D),
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? const Color(0xFFE8E44A) : Colors.white24,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
              color: selected ? Colors.black : Colors.white,
              errorBuilder: (_, __, ___) => Icon(
                label == 'Male' ? Icons.male : Icons.female,
                color: selected ? Colors.black : Colors.white,
                size: 48,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(label,
              style: TextStyle(
                color: selected ? const Color(0xFFE8E44A) : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class SetupAgeScreen extends StatefulWidget {
  const SetupAgeScreen({super.key});

  @override
  State<SetupAgeScreen> createState() => _SetupAgeScreenState();
}

class _SetupAgeScreenState extends State<SetupAgeScreen> {
  int _age = 28;

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
              const Text('How Old Are You?',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.5),
              ),
              const Spacer(),
              // Selected age big
              Center(
                child: Text('$_age',
                    style: const TextStyle(
                        color: Colors.white, fontSize: 72, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(height: 8),
              // Triangle pointer
              const Center(
                child: Icon(Icons.arrow_drop_up, color: Color(0xFFE8E44A), size: 36),
              ),
              const SizedBox(height: 8),
              // Scrollable age picker
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(
                    initialScrollOffset: (_age - 18) * 56.0,
                  ),
                  itemCount: 83, // 18 to 100
                  itemBuilder: (context, index) {
                    final age = index + 18;
                    final isSelected = age == _age;
                    return GestureDetector(
                      onTap: () => setState(() => _age = age),
                      child: Container(
                        width: 56,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFB39DDB).withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '$age',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white38,
                            fontSize: isSelected ? 22 : 16,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.setupWeight),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D2D2D),
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
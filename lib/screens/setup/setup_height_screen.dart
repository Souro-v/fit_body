import 'package:fit_body/screens/setup/setup_widgets.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class SetupHeightScreen extends StatefulWidget {
  const SetupHeightScreen({super.key});

  @override
  State<SetupHeightScreen> createState() => _SetupHeightScreenState();
}

class _SetupHeightScreenState extends State<SetupHeightScreen> {
  int _height = 165;

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
              const Text('What Is Your Height?',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.5),
              ),
              const Spacer(),
              // Height display
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('$_height',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 72, fontWeight: FontWeight.w800)),
                  const SizedBox(width: 6),
                  const Text('Cm',
                      style: TextStyle(color: Colors.white54, fontSize: 22)),
                ],
              ),
              const SizedBox(height: 24),
              // Vertical ruler
              Center(
                child: SizedBox(
                  width: 80,
                  height: 280,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Ruler bar
                      Container(
                        width: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB39DDB).withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          reverse: true,
                          itemCount: 101,
                          controller: ScrollController(
                            initialScrollOffset: (_height - 100) * 14.0,
                          ),
                          itemBuilder: (context, index) {
                            final h = index + 100;
                            final isSelected = h == _height;
                            final isMajor = (h % 5 == 0);
                            return GestureDetector(
                              onTap: () => setState(() => _height = h),
                              child: Container(
                                height: 14,
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    if (isMajor)
                                      Text(
                                        '$h',
                                        style: TextStyle(
                                          color: isSelected
                                              ? const Color(0xFFE8E44A)
                                              : Colors.white38,
                                          fontSize: 9,
                                        ),
                                      ),
                                    const Spacer(),
                                    Container(
                                      width: isMajor ? 20 : 12,
                                      height: 1.5,
                                      color: isSelected
                                          ? const Color(0xFFE8E44A)
                                          : Colors.white24,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Arrow pointer
                      const Positioned(
                        right: 0,
                        child: Icon(Icons.arrow_left,
                            color: Color(0xFFE8E44A), size: 28),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              ContinueButton(
                onTap: () => Navigator.pushNamed(context, AppRoutes.setupGoal),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
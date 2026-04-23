
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class SetupWeightScreen extends StatefulWidget {
  const SetupWeightScreen({super.key});

  @override
  State<SetupWeightScreen> createState() => _SetupWeightScreenState();
}

class _SetupWeightScreenState extends State<SetupWeightScreen> {
  double _weight = 75;
  bool _isKg = true;

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
              const Text('What Is Your Weight?',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.5),
              ),
              const Spacer(),
              // KG / LB toggle
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A1F3D),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFFE8E44A)),
                ),
                child: Row(
                  children: [
                    _UnitTab(label: 'KG', selected: _isKg, onTap: () => setState(() => _isKg = true)),
                    _UnitTab(label: 'LB', selected: !_isKg, onTap: () => setState(() => _isKg = false)),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Ruler
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(initialScrollOffset: (_weight - 40) * 20.0),
                  itemCount: 161,
                  itemBuilder: (context, index) {
                    final w = index + 40.0;
                    final isSelected = w == _weight;
                    final isMajor = (w % 5 == 0);
                    return GestureDetector(
                      onTap: () => setState(() => _weight = w),
                      child: Container(
                        width: 20,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (isSelected)
                              Text(
                                '${w.toInt()}',
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            Container(
                              width: 2,
                              height: isMajor ? 28 : 16,
                              color: isSelected
                                  ? const Color(0xFFE8E44A)
                                  : Colors.white38,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Triangle + weight display
              const Center(
                child: Icon(Icons.arrow_drop_up, color: Color(0xFFE8E44A), size: 36),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${_weight.toInt()}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 52, fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: _isKg ? ' Kg' : ' Lb',
                        style: const TextStyle(color: Colors.white54, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.setupHeight),
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

class _UnitTab extends StatelessWidget {
  const _UnitTab({required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFE8E44A) : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
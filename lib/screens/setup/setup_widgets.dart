import 'package:flutter/material.dart';

class SetupBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back_ios, color: Color(0xFFE8E44A), size: 14),
          SizedBox(width: 4),
          Text('Back', style: TextStyle(color: Color(0xFFE8E44A), fontSize: 14)),
        ],
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({required this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: onTap == null
              ? const Color(0xFF2D2D2D).withOpacity(0.5)
              : const Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white12),
        ),
        alignment: Alignment.center,
        child: const Text('Continue',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
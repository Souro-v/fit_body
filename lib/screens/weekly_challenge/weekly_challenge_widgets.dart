// lib/screens/weekly_challenge/weekly_challenge_widgets.dart

import 'package:flutter/material.dart';
import '../../widgets/app_widgets.dart';

class WCBadge extends StatelessWidget {
  const WCBadge({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.w600)),
    );
  }
}

class WCExerciseCard extends StatelessWidget {
  const WCExerciseCard({super.key, required this.exercise, this.onTap});
  final WCExercise exercise;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.yellow,
              child: Icon(Icons.play_arrow, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 3),
                  Row(children: [
                    const Icon(Icons.timer_outlined,
                        color: AppColors.purple, size: 12),
                    const SizedBox(width: 3),
                    Text(exercise.duration,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 11)),
                  ]),
                ],
              ),
            ),
            Text(exercise.repetition,
                style: const TextStyle(
                    color: AppColors.purple,
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class WCRound {
  final String title;
  final List<WCExercise> exercises;
  WCRound({required this.title, required this.exercises});
}

class WCExercise {
  final String title;
  final String duration;
  final String repetition;
  WCExercise({
    required this.title,
    required this.duration,
    required this.repetition,
  });
}
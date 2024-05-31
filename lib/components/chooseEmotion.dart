import 'package:flutter/material.dart';

import '../data/workout_history_model.dart';

class ChooseEmotion extends StatelessWidget {
  final VoidCallback onTap;
  final Emotions emotions;
  final Color? backgroundColor;

  const ChooseEmotion({
    super.key,
    required this.onTap,
    this.backgroundColor,
    required this.emotions,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          child: SizedBox(
            width: 28,
            height: 34,
            child: emotions.asEmotion,
          ),
        ),
      ),
    );
  }
}

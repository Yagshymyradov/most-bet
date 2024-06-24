import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../utils/extensions.dart';
import '../utils/theme/theme.dart';

class WorkoutHistory extends StatelessWidget {
  final String title;
  final String dateTime;
  final String duration;
  final Widget emotion;
  final int stress;
  final int fatigue;
  final int intensity;

  const WorkoutHistory({
    super.key,
    required this.title,
    required this.dateTime,
    required this.duration,
    required this.emotion,
    required this.stress,
    required this.fatigue,
    required this.intensity,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: '\n$dateTime',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Text(
              l10n.min(duration),
              style: textTheme.titleLarge?.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
        const Divider(thickness: 0.5),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.emotions,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 20,
                  height: 25,
                  child: emotion,
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.stress,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.evaluate(stress),
                  style: textTheme.titleSmall?.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.fatigue,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.evaluate(fatigue),
                  style: textTheme.titleSmall?.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.intensity,
                  style: textTheme.headlineMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.evaluate(intensity),
                  style: textTheme.titleSmall?.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

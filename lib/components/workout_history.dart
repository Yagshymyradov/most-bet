import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../utils/assets.dart';
import '../utils/extensions.dart';
import '../utils/theme/theme.dart';

class WorkoutHistory extends StatelessWidget {
  const WorkoutHistory({super.key});

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
                    text: l10n.stretching,
                    style: textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: '\n22.01.2024',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Text(
              l10n.min(30),
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
                  child: AppIcons.blush.pngEmoji,
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
                  l10n.evaluate(5),
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
                  l10n.evaluate(6),
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
                  l10n.evaluate(7),
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

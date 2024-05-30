import 'package:flutter/material.dart';

import '../../components/profile_image.dart';
import '../../components/workout_history.dart';
import '../../l10n/l10n.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          ListView(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ProfileImage(
                  image: AppIcons.dog.pngPicture,
                  width: 44,
                  height: 44,
                ),
              ),
              Text(l10n.workout, style: textTheme.titleLarge),
              const SizedBox(height: 20),
              const WorkoutHistory(),
              const WorkoutHistory(),
              const WorkoutHistory(),
              const WorkoutHistory(),
              const WorkoutHistory(),
              const WorkoutHistory(),
            ],
          ),
          Positioned(
            bottom: 18,
            right: 22,
            child: ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                maximumSize: MaterialStatePropertyAll(Size(139, 36)),
                minimumSize: MaterialStatePropertyAll(Size(129, 36)),
              ),
              child: Text(
                'Add workout',
                style: textTheme.headlineMedium?.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

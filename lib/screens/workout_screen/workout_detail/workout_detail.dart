import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/cell_with_ratings.dart';
import '../../../data/workout_history_controller.dart';
import '../../../data/workout_history_model.dart';
import '../../../l10n/l10n.dart';
import '../../../utils/assets.dart';
import '../../../utils/extensions.dart';
import '../../../utils/theme/theme.dart';

class WorkoutDetail extends StatelessWidget {
  final WorkoutHistoryModel workout;
  final VoidCallback onEditWorkout;

  const WorkoutDetail({
    super.key,
    required this.workout,
    required this.onEditWorkout,
  });

  void onDeleteButtonTap(BuildContext context) {
    final scope = ProviderScope.containerOf(context, listen: false);
    final history = scope.read(workoutHistoryProvider.notifier);
    history.repo?.removeFromWorkoutList(workout.id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => onDeleteButtonTap(context),
                icon: AppIcons.delete.svgPicture(),
              ),
              IconButton(
                onPressed: onEditWorkout,
                icon: AppIcons.pen.svgPicture(),
              ),
            ],
          ),
          Text(workout.title, style: textTheme.titleLarge),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(workout.dateTime, style: textTheme.bodyLarge),
              Text(
                l10n.emotions,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.min(workout.duration),
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 17,
                height: 22,
                child: workout.emotion.asEmotion,
              ),
            ],
          ),
          const SizedBox(height: 33),
          CellWithRatings(
            title: l10n.fatigue,
            evaluate: workout.fatigue.toInt(),
          ),
          CellWithRatings(
            title: l10n.stress,
            evaluate: workout.stress.toInt(),
          ),
          const SizedBox(height: 6),
          CellWithRatings(
            title: l10n.intensity,
            evaluate: workout.intensity.toInt(),
          ),
        ],
      ),
    );
  }
}

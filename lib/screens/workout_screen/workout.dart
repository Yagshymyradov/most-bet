import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/indicators.dart';
import '../../components/modal_bottom_sheet.dart';
import '../../components/profile_image.dart';
import '../../components/workout_history.dart';
import '../../data/workout_history_controller.dart';
import '../../l10n/l10n.dart';
import '../../provider.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';
import 'add_workout/add_workout.dart';
import 'profile.dart';
import 'workout_detail/workout_detail.dart';

class Workout extends ConsumerStatefulWidget {
  const Workout({super.key});

  @override
  ConsumerState<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends ConsumerState<Workout> {
  void updateUi() {
    setState(() {
      //no-op
    });
  }

  void addButtonTap() {
    modalBottomSheet(context, const AddWorkout()).whenComplete(updateUi);
  }

  @override
  Widget build(BuildContext context) {
    final workout = ref.watch(workoutHistoryProvider.notifier).repo?.getWorkoutList();
    final authState = ref.watch(authControllerProvider);
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
                child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () => modalBottomSheet(context, const Profile()),
                  child: ProfileImage(
                    width: 44,
                    height: 44,
                    image: authState?.photo?.asImage ?? const SizedBox(),
                  ),
                ),
              ),
              Text(l10n.workout, style: textTheme.titleLarge),
              const SizedBox(height: 20),
              ...workout
                      ?.map(
                        (e) => InkWell(
                          onTap: () => modalBottomSheet(
                            context,
                            WorkoutDetail(workout: e),
                          ).whenComplete(updateUi),
                          child: WorkoutHistory(
                            title: e.title,
                            dateTime: e.dateTime,
                            duration: e.duration,
                            emotion: e.emotion.asEmotion,
                            stress: e.stress.toInt(),
                            fatigue: e.fatigue.toInt(),
                            intensity: e.intensity.toInt(),
                          ),
                        ),
                      )
                      .toList() ??
                  [],
              if (workout!.isEmpty)
                EmptyIndicator(
                  title: l10n.addFirstWorkout,
                  onPressed: addButtonTap,
                ),
            ],
          ),
          Positioned(
            bottom: 18,
            right: 22,
            child: ElevatedButton(
              onPressed: addButtonTap,
              style: const ButtonStyle(
                maximumSize: MaterialStatePropertyAll(Size(139, 36)),
                minimumSize: MaterialStatePropertyAll(Size(129, 36)),
              ),
              child: Text(
                l10n.addWorkout,
                style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

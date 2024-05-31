import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/chooseEmotion.dart';
import '../../../components/field_text.dart';
import '../../../components/rate_slider.dart';
import '../../../data/workout_history_controller.dart';
import '../../../data/workout_history_model.dart';
import '../../../l10n/l10n.dart';
import '../../../utils/assets.dart';
import '../../../utils/extensions.dart';
import '../../../utils/theme/theme.dart';

class AddWorkout extends ConsumerStatefulWidget {
  const AddWorkout({super.key});

  @override
  ConsumerState<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends ConsumerState<AddWorkout> {
  final titleController = TextEditingController();
  final dateTimeController = TextEditingController();
  final durationController = TextEditingController();
  Emotions? selectedEmotion;
  double fatigueValue = 0;
  double stressValue = 0;
  double intensityValue = 0;

  void updateUi() {
    setState(() {
      //no-op
    });
  }

  void onFatigueChanged(double value) {
    fatigueValue = value;
    updateUi();
  }

  void onStressChanged(double value) {
    stressValue = value;
    updateUi();
  }

  void onIntensityChanged(double value) {
    intensityValue = value;
    updateUi();
  }

  void onChooseEmotion(Emotions emotion) {
    selectedEmotion = emotion;
    updateUi();
  }

  void addButtonTap() {
    final history = ref.read(workoutHistoryProvider.notifier);
    if(selectedEmotion == null) return;

    history.repo?.addToWorkoutList(
      WorkoutHistory(
        title: titleController.text,
        dateTime: dateTimeController.text,
        duration: durationController.text,
        emotion: selectedEmotion ?? Emotions.blush,
        stress: stressValue,
        fatigue: fatigueValue,
        intensity: intensityValue,
      ),
    );

    Navigator.pop<bool>(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    dateTimeController.dispose();
    durationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 25),
      children: [
        const SizedBox(width: 22),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 22),
                  Text(
                    l10n.addWorkout,
                    style: textTheme.headlineMedium?.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  IconButton(
                    onPressed: addButtonTap,
                    icon: AppIcons.add.svgPicture(),
                  ),
                ],
              ),
              const SizedBox(height: 21),
              FieldText(
                hintText: l10n.typeOfWorkout,
                controller: titleController,
              ),
              const SizedBox(height: 16),
              FieldText(
                hintText: l10n.chooseDate,
                controller: dateTimeController,
              ),
              const SizedBox(height: 16),
              FieldText(
                hintText: l10n.trainingTime,
                controller: durationController,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        RateSlider(
          title: l10n.fatigueDescription,
          value: fatigueValue,
          onChanged: onFatigueChanged,
        ),
        RateSlider(
          title: l10n.stressDescription,
          value: stressValue,
          onChanged: onStressChanged,
        ),
        RateSlider(
          title: l10n.intensityDescription,
          value: intensityValue,
          onChanged: onIntensityChanged,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(l10n.emotions, style: textTheme.headlineMedium),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Emotions.values
                .map(
                  (e) => ChooseEmotion(
                    onTap: ()=> onChooseEmotion(e),
                    emotions: e,
                    backgroundColor: selectedEmotion == e ? AppColors.primaryColor : null,
                  ),
                )
                .toList(growable: false),
          ),
        ),
      ],
    );
  }
}

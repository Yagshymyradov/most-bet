import 'package:flutter/material.dart';

import '../../../components/chooseEmotion.dart';
import '../../../components/field_text.dart';
import '../../../components/rate_slider.dart';
import '../../../l10n/l10n.dart';
import '../../../utils/assets.dart';
import '../../../utils/enums.dart';
import '../../../utils/extensions.dart';
import '../../../utils/theme/theme.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({super.key});

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  final workoutController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  double fatigueValue = 0;
  double stressValue = 0;
  double intensityValue = 0;
  Emotions? selectedEmotion;

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
                  AppIcons.add.svgPicture(),
                ],
              ),
              const SizedBox(height: 21),
              FieldText(
                hintText: l10n.typeOfWorkout,
                controller: workoutController,
              ),
              const SizedBox(height: 16),
              FieldText(
                hintText: l10n.chooseDate,
                controller: dateController,
              ),
              const SizedBox(height: 16),
              FieldText(
                hintText: l10n.trainingTime,
                controller: timeController,
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
                    backgroundColor: selectedEmotion == e ? AppColors.primaryColor : null,
                    emotions: e,
                  ),
                )
                .toList(growable: false),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/chooseEmotion.dart';
import '../../components/field_text.dart';
import '../../components/outlined_dropdown_button_form_field.dart';
import '../../components/small_buttons.dart';
import '../../data/statistic_controller.dart';
import '../../data/statistic_model.dart';
import '../../data/workout_history_model.dart';
import '../../l10n/l10n.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';
import 'add_another_statistica.dart';

class AddStatistic extends ConsumerStatefulWidget {
  const AddStatistic({super.key});

  @override
  ConsumerState<AddStatistic> createState() => _AddStatisticState();
}

class _AddStatisticState extends ConsumerState<AddStatistic> {
  final typeWorkoutController = TextEditingController();
  final timeSpendController = TextEditingController();
  Month? selectedMonth;
  Emotions? selectedEmotion;
  bool addAnotherWorkout = false;
  bool workoutAdded = false;

  void onAddAnotherWorkoutTap() {
    addAnotherWorkout = true;
    setState(() {
      //no-op
    });
  }

  void addStatisticButton() {
    if (selectedMonth == null || selectedEmotion == null) return;

    workoutAdded = true;
    setState(() {
      //no-op
    });

    final statisticRepo = ref.read(statisticProvider.notifier);
    statisticRepo.repo?.addToStatisticList(
      StatisticModel(
        type: typeWorkoutController.text,
        month: selectedMonth ?? Month.january,
        timeSpent: int.parse(timeSpendController.text),
        emotion: selectedEmotion ?? Emotions.blush,
      ),
    );
    Navigator.pop(context);
  }

  void onEmotionsTap(Emotions emotion) {
    selectedEmotion = emotion;
    setState(() {
      //no-op
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40),
            Text(
              l10n.addStatistics,
              style: textTheme.headlineMedium?.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            IconButton(
              onPressed: addStatisticButton,
              icon: AppIcons.add.svgPicture(),
            ),
          ],
        ),
        Text(l10n.emotions, style: textTheme.headlineMedium),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: Emotions.values
              .map(
                (e) => ChooseEmotion(
                  onTap: () => onEmotionsTap(e),
                  emotions: e,
                  backgroundColor: selectedEmotion == e ? AppColors.primaryColor : null,
                ),
              )
              .toList(growable: false),
        ),
        const SizedBox(height: 16),
        OutlineDropdownButtonFormField<Month>(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(12, 8, 8, 7),
          ),
          hint: Text(l10n.chooseMonth, style: textTheme.bodyLarge),
          value: selectedMonth,
          items: Month.values
              .map(
                (e) => DropdownMenuItem<Month>(
                  value: e,
                  child: Text(
                    e.asValue(context),
                  ),
                ),
              )
              .toList(growable: false),
          onChanged: (value) {
            selectedMonth = value;
            setState(() {
              //no-op
            });
          },
        ),
        const SizedBox(height: 16),
        FieldText(
          controller: typeWorkoutController,
          hintText: l10n.typeOfWorkout,
        ),
        const SizedBox(height: 16),
        FieldText(
          controller: timeSpendController,
          hintText: l10n.timeSpent,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: SmallButton(
            onTap: onAddAnotherWorkoutTap,
            title: l10n.addAnotherWorkout,
          ),
        ),
        if (addAnotherWorkout)
          AddAnotherWorkout(
            selectedMonth: selectedMonth,
            selectedEmotion: selectedEmotion,
            workoutAdded: workoutAdded,
          ),
      ],
    );
  }
}

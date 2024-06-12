import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/field_text.dart';
import '../../components/small_buttons.dart';
import '../../data/statistic_controller.dart';
import '../../data/statistic_model.dart';
import '../../data/workout_history_model.dart';
import '../../l10n/l10n.dart';

class AddAnotherWorkout extends StatefulWidget {
  final Month? selectedMonth;
  final Emotions? selectedEmotion;
  final bool workoutAdded;

  const AddAnotherWorkout({
    super.key,
    required this.selectedMonth,
    required this.selectedEmotion,
    required this.workoutAdded,
  });

  @override
  State<AddAnotherWorkout> createState() => _AddAnotherWorkoutState();
}

class _AddAnotherWorkoutState extends State<AddAnotherWorkout> {
  final typeController = TextEditingController();
  final timeController = TextEditingController();

  bool addAnotherWorkout = false;

  void onAddAnotherWorkoutTap() {
    addAnotherWorkout = true;
    setState(() {
      //no-op
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (typeController.text.isNotEmpty && timeController.text.isNotEmpty && widget.workoutAdded) {
      final scope = ProviderScope.containerOf(context, listen: false);
      final statisticRepo = scope.read(statisticProvider.notifier);
      statisticRepo.repo?.addToStatisticList(
        StatisticModel(
          type: typeController.text,
          month: widget.selectedMonth ?? Month.january,
          timeSpent: int.parse(timeController.text),
          emotion: widget.selectedEmotion ?? Emotions.blush,
        ),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        FieldText(
          controller: typeController,
          hintText: l10n.typeOfWorkout,
        ),
        const SizedBox(height: 16),
        FieldText(
          controller: timeController,
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
            selectedMonth: widget.selectedMonth,
            selectedEmotion: widget.selectedEmotion,
            workoutAdded: widget.workoutAdded,
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}

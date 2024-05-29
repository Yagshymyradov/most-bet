import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';
import '../../../utils/enums.dart';
import '../../../utils/extensions.dart';
import '../../../utils/theme/theme.dart';

class ChooseWorkoutType extends StatefulWidget {
  final VoidCallback onNextButtonTap;

  const ChooseWorkoutType({
    super.key,
    required this.onNextButtonTap,
  });

  @override
  State<ChooseWorkoutType> createState() => _ChooseWorkoutTypeState();
}

class _ChooseWorkoutTypeState extends State<ChooseWorkoutType> {
  List<WorkoutTypes> selectedTypes = [];

  void onWorkoutTypesTap(WorkoutTypes type) {
    if (selectedTypes.contains(type)) {
      selectedTypes.removeWhere((element) => element == type);
    } else {
      selectedTypes.add(type);
    }
    setState(() {
      //no-op
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 134),
          Text(
            l10n.letsCreteProfile,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          Text(
            l10n.chooseFavoriteWorkout,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: 40),
          Wrap(
            runSpacing: 8,
            spacing: 8,
            children: WorkoutTypes.values
                .mapIndexed(
                  (e, i) => InkWell(
                    borderRadius: BorderRadius.circular(23),
                    onTap: () => onWorkoutTypesTap(e),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: e.backgroundColor(selectedTypes.contains(e)),
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 8,
                        ),
                        child: Text(
                          e.asValue(context),
                          style: textTheme.headlineMedium?.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(growable: false),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: selectedTypes.isEmpty ? null : widget.onNextButtonTap,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                selectedTypes.isNotEmpty //
                    ? null
                    : AppColors.primaryColor.withOpacity(0.5),
              ),
            ),
            child: Text(
              l10n.next,
              style: textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 65),
        ],
      ),
    );
  }
}

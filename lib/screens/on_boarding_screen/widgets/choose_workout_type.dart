import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/small_buttons.dart';
import '../../../data/auth_model.dart';
import '../../../l10n/l10n.dart';
import '../../../provider.dart';
import '../../../utils/enums.dart';
import '../../../utils/extensions.dart';
import '../../../utils/theme/theme.dart';

class ChooseWorkoutType extends StatefulWidget {
  final AuthModel authModel;
  final VoidCallback onNextButtonTap;

  const ChooseWorkoutType({
    super.key,
    required this.authModel,
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

  Future<void> whenTapNextButton() async {
    final scope = ProviderScope.containerOf(context, listen: false);
    final authController = scope.read(authControllerProvider.notifier);

    widget.authModel.workoutTypes = selectedTypes;

    try {
      await authController.onSignedIn(widget.authModel);
    } catch (e) {
      //ignore
    }

    if (selectedTypes.isNotEmpty) {
      widget.onNextButtonTap();
    }
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
                  (e, i) => SmallButton(
                    title: e.asValue(context),
                    onTap: () => onWorkoutTypesTap(e),
                    backgroundColor: e.backgroundColor(selectedTypes.contains(e)),
                  ),
                )
                .toList(growable: false),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: whenTapNextButton,
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

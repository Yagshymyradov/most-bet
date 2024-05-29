import 'package:flutter/material.dart';

import 'assets.dart';
import 'theme/theme.dart';

enum ProfilePhoto {
  girl,
  boy,
  dog;

  Widget get asImage {
    switch (this) {
      case ProfilePhoto.girl:
        return AppIcons.girl.pngPicture;
      case ProfilePhoto.boy:
        return AppIcons.boy.pngPicture;
      case ProfilePhoto.dog:
        return AppIcons.dog.pngPicture;
    }
  }

  Color backgroundColor(bool imageSelected) {
    return imageSelected //
        ? AppColors.primaryColor
        : AppColors.primaryColor.withOpacity(0.5);
  }
}

enum WorkoutTypes {
  swimming,
  yoga,
  cardio,
  functionalTraining,
  stretching,
  rollRelax,
  crossfit,
  pump;

  String asValue() {
    switch (this) {
      case WorkoutTypes.swimming:
        return 'Swimming';
      case WorkoutTypes.yoga:
        return 'Yoga';
      case WorkoutTypes.cardio:
        return 'Cardio';
      case WorkoutTypes.functionalTraining:
        return 'Functional Trading';
      case WorkoutTypes.stretching:
        return 'Stretching';
      case WorkoutTypes.rollRelax:
        return 'Roll Relax';
      case WorkoutTypes.crossfit:
        return 'Crossfit';
      case WorkoutTypes.pump:
        return 'Pump';
    }
  }

  Color backgroundColor(bool selected) {
    return selected //
        ? AppColors.primaryColor
        : AppColors.primaryColor.withOpacity(0.5);
  }
}

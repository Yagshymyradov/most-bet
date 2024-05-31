import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
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

  String toJson()=> name;

  static ProfilePhoto fromJson(String json)=> values.byName(json);
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

  String asValue(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case WorkoutTypes.swimming:
        return l10n.swimming;
      case WorkoutTypes.yoga:
        return l10n.yoga;
      case WorkoutTypes.cardio:
        return l10n.cardio;
      case WorkoutTypes.functionalTraining:
        return l10n.functionalTrading;
      case WorkoutTypes.stretching:
        return l10n.stretching;
      case WorkoutTypes.rollRelax:
        return l10n.rollRelax;
      case WorkoutTypes.crossfit:
        return l10n.crossfit;
      case WorkoutTypes.pump:
        return l10n.pump;
    }
  }

  Color backgroundColor(bool selected) {
    return selected //
        ? AppColors.primaryColor
        : AppColors.primaryColor.withOpacity(0.5);
  }

  String toJson()=> name;

  static WorkoutTypes fromJson(String json)=> values.byName(json);
}

enum Emotions{
  relieved,
  blush,
  expressionless,
  tired,
  persevering;

  Widget get asEmotion{
    switch(this){
      case Emotions.relieved:
        return AppIcons.relieved.pngEmoji;
      case Emotions.blush:
        return AppIcons.blush.pngEmoji;
      case Emotions.expressionless:
        return AppIcons.expressionless.pngEmoji;
      case Emotions.tired:
        return AppIcons.tired.pngEmoji;
      case Emotions.persevering:
        return AppIcons.persevering.pngEmoji;
    }
  }
}

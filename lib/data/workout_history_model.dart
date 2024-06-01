import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../utils/assets.dart';

part 'workout_history_model.g.dart';

@HiveType(typeId: 1)
class WorkoutHistoryModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String dateTime;
  @HiveField(3)
  final String duration;
  @HiveField(4)
  final Emotions emotion;
  @HiveField(5)
  final double stress;
  @HiveField(6)
  final double fatigue;
  @HiveField(7)
  final double intensity;

  WorkoutHistoryModel({
    required this.title,
    required this.dateTime,
    required this.duration,
    required this.emotion,
    required this.stress,
    required this.fatigue,
    required this.intensity,
  }) : id = const Uuid().v4();

  WorkoutHistoryModel copyWith({
    String? id,
    String? title,
    String? dateTime,
    String? duration,
    Emotions? emotion,
    double? stress,
    double? fatigue,
    double? intensity,
  }) {
      return WorkoutHistoryModel(title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      duration: duration ?? this.duration,
      emotion: emotion ?? this.emotion,
      stress: stress ?? this.stress,
      fatigue: fatigue ?? this.fatigue,
      intensity: intensity ?? this.intensity,
    );
  }
}

@HiveType(typeId: 2)
enum Emotions{
  @HiveField(0)
  relieved,
  @HiveField(1)
  blush,
  @HiveField(2)
  expressionless,
  @HiveField(3)
  tired,
  @HiveField(4)
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

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../l10n/l10n.dart';
import 'workout_history_model.dart';

part 'statistic_model.g.dart';

@HiveType(typeId: 3)
class StatisticModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String type;
  @HiveField(2)
  final Emotions emotion;
  @HiveField(3)
  final Month month;
  @HiveField(4)
  final int timeSpent;

  StatisticModel({
    required this.type,
    required this.emotion,
    required this.month,
    required this.timeSpent,
  }) : id = const Uuid().v4();
}

@HiveType(typeId: 4)
enum Month {
  @HiveField(0)
  january,
  @HiveField(1)
  february,
  @HiveField(2)
  march,
  @HiveField(3)
  april,
  @HiveField(4)
  may,
  @HiveField(5)
  june,
  @HiveField(6)
  july,
  @HiveField(7)
  august,
  @HiveField(8)
  september,
  @HiveField(9)
  october,
  @HiveField(10)
  november,
  @HiveField(11)
  december;

  String asValue(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case Month.january:
        return l10n.january;
      case Month.february:
        return l10n.february;
      case Month.march:
        return l10n.march;
      case Month.april:
        return l10n.april;
      case Month.may:
        return l10n.may;
      case Month.june:
        return l10n.june;
      case Month.july:
        return l10n.july;
      case Month.august:
        return l10n.august;
      case Month.september:
        return l10n.september;
      case Month.october:
        return l10n.october;
      case Month.november:
        return l10n.november;
      case Month.december:
        return l10n.december;
    }
  }
}

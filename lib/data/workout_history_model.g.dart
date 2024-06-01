// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutHistoryModelAdapter extends TypeAdapter<WorkoutHistoryModel> {
  @override
  final int typeId = 1;

  @override
  WorkoutHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutHistoryModel(
      title: fields[1] as String,
      dateTime: fields[2] as String,
      duration: fields[3] as String,
      emotion: fields[4] as Emotions,
      stress: fields[5] as double,
      fatigue: fields[6] as double,
      intensity: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutHistoryModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.emotion)
      ..writeByte(5)
      ..write(obj.stress)
      ..writeByte(6)
      ..write(obj.fatigue)
      ..writeByte(7)
      ..write(obj.intensity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmotionsAdapter extends TypeAdapter<Emotions> {
  @override
  final int typeId = 2;

  @override
  Emotions read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Emotions.relieved;
      case 1:
        return Emotions.blush;
      case 2:
        return Emotions.expressionless;
      case 3:
        return Emotions.tired;
      case 4:
        return Emotions.persevering;
      default:
        return Emotions.relieved;
    }
  }

  @override
  void write(BinaryWriter writer, Emotions obj) {
    switch (obj) {
      case Emotions.relieved:
        writer.writeByte(0);
        break;
      case Emotions.blush:
        writer.writeByte(1);
        break;
      case Emotions.expressionless:
        writer.writeByte(2);
        break;
      case Emotions.tired:
        writer.writeByte(3);
        break;
      case Emotions.persevering:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

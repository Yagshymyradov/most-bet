// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatisticModelAdapter extends TypeAdapter<StatisticModel> {
  @override
  final int typeId = 3;

  @override
  StatisticModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatisticModel(
      type: fields[1] as String,
      emotion: fields[2] as Emotions,
      month: fields[3] as Month,
      timeSpent: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StatisticModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.emotion)
      ..writeByte(3)
      ..write(obj.month)
      ..writeByte(4)
      ..write(obj.timeSpent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatisticModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MonthAdapter extends TypeAdapter<Month> {
  @override
  final int typeId = 4;

  @override
  Month read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Month.january;
      case 1:
        return Month.february;
      case 2:
        return Month.march;
      case 3:
        return Month.april;
      case 4:
        return Month.may;
      case 5:
        return Month.june;
      case 6:
        return Month.july;
      case 7:
        return Month.august;
      case 8:
        return Month.september;
      case 9:
        return Month.october;
      case 10:
        return Month.november;
      case 11:
        return Month.december;
      default:
        return Month.january;
    }
  }

  @override
  void write(BinaryWriter writer, Month obj) {
    switch (obj) {
      case Month.january:
        writer.writeByte(0);
        break;
      case Month.february:
        writer.writeByte(1);
        break;
      case Month.march:
        writer.writeByte(2);
        break;
      case Month.april:
        writer.writeByte(3);
        break;
      case Month.may:
        writer.writeByte(4);
        break;
      case Month.june:
        writer.writeByte(5);
        break;
      case Month.july:
        writer.writeByte(6);
        break;
      case Month.august:
        writer.writeByte(7);
        break;
      case Month.september:
        writer.writeByte(8);
        break;
      case Month.october:
        writer.writeByte(9);
        break;
      case Month.november:
        writer.writeByte(10);
        break;
      case Month.december:
        writer.writeByte(11);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

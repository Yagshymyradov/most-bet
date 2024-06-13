import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 5)
class NotesModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String dateTime;
  @HiveField(3)
  final String note;

  NotesModel({
    required this.title,
    required this.dateTime,
    required this.note,
  }) : id = const Uuid().v4();

  NotesModel copeWith({
    String? title,
    String? dateTime,
    String? note,
  }) {
    return NotesModel(
      title: title ?? this.title,
      dateTime: dateTime ?? this.dateTime,
      note: note ?? this.note,
    );
  }
}

import 'package:hive/hive.dart';

import '../notes_model.dart';

class NotesRepo {
  String notes = 'notes';

  final _hive = Hive.box<NotesModel>('notes');

  List<NotesModel>? getNotesList() {
    return _hive.values.toList();
  }

  List<NotesModel> addToNodesList(NotesModel notes) {
    _hive.add(notes);
    return _hive.values.toList();
  }

  List<NotesModel> removeFromNotesList(String id) {
    _hive.deleteAt(
      _hive.values.toList().indexWhere((element) => element.id == id),
    );

    return _hive.values.toList();
  }

  List<NotesModel> updateNotesList(int index, NotesModel notes) {
    _hive.putAt(index, notes);
    return _hive.values.toList();
  }

  void deleteAll() {
    _hive.clear();
  }
}

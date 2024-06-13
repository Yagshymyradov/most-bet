import 'package:hive/hive.dart';

import '../notes_model.dart';

class FavoriteNotesRepo {
  String favoriteNotes = 'favorite_notes';

  final _hive = Hive.box<NotesModel>('favorite_notes');

  List<NotesModel>? getFavoriteNotesList() {
    return _hive.values.toList();
  }

  List<NotesModel> addToFavoriteNotesList(NotesModel notes) {
    _hive.add(notes);
    return _hive.values.toList();
  }

  List<NotesModel> removeFromFavoriteNotesList(String id) {
    _hive.deleteAt(
      _hive.values.toList().indexWhere((element) => element.id == id),
    );

    return _hive.values.toList();
  }

  List<NotesModel> updateFavoriteNotesList(int index, NotesModel notes) {
    _hive.putAt(index, notes);
    return _hive.values.toList();
  }

  void deleteAll() {
    _hive.clear();
  }
}

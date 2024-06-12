import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notes_model.dart';
import 'service/notes_repo.dart';

final notesRepoProvider = Provider<NotesRepo>((ref) => NotesRepo());

final notesProvider = StateNotifierProvider<NotesController, List<NotesModel>?>(
  NotesController.new,
);

class NotesController extends StateNotifier<List<NotesModel>?> {
  NotesRepo? repo;

  final StateNotifierProviderRef<dynamic, dynamic> ref;

  NotesController(this.ref) : super(null) {
    repo = ref.read(notesRepoProvider);
    getNotes();
  }

  void getNotes(){
    state = repo?.getNotesList();
  }

  void addNotes(NotesModel notes){
    state = repo?.addToNodesList(notes);
  }

  void updateNotes(int index, NotesModel notes){
    state = repo?.updateNotesList(index, notes);
  }

  void removeNotes(String id){
    state = repo?.removeFromNotesList(id);
  }
}

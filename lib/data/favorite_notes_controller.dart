import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notes_model.dart';
import 'service/favorite_notes_repo.dart';

final favoriteNotesRepoProvider = Provider<FavoriteNotesRepo>((ref) => FavoriteNotesRepo());

final favoriteNotesProvider = StateNotifierProvider<FavoriteNotesController, List<NotesModel>?>(
  FavoriteNotesController.new,
);

class FavoriteNotesController extends StateNotifier<List<NotesModel>?> {
  FavoriteNotesRepo? repo;

  final StateNotifierProviderRef<dynamic, dynamic> ref;

  FavoriteNotesController(this.ref) : super(null) {
    repo = ref.read(favoriteNotesRepoProvider);
    getFavoriteNotes();
  }

  void getFavoriteNotes(){
    state = repo?.getFavoriteNotesList();
  }

  void addFavoriteNotes(NotesModel notes){
    state = repo?.addToFavoriteNotesList(notes);
  }

  void updateFavoriteNotes(int index, NotesModel notes){
    state = repo?.updateFavoriteNotesList(index, notes);
  }

  void removeFavoriteNotes(String id){
    state = repo?.removeFromFavoriteNotesList(id);
  }
}

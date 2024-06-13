import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/favorite_notes_controller.dart';
import '../../data/notes_controller.dart';
import '../../data/notes_model.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';

class NoteDetail extends StatefulWidget {
  final NotesModel notes;
  final VoidCallback onNotesEdit;

  const NoteDetail({
    super.key,
    required this.notes,
    required this.onNotesEdit,
  });

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  void onDeleteButtonTap(BuildContext context) {
    final scope = ProviderScope.containerOf(context, listen: false);
    final history = scope.read(notesProvider.notifier);
    history.repo?.removeFromNotesList(widget.notes.id);
    Navigator.pop(context);
  }

  bool isFavoritePost() {
    final scope = ProviderScope.containerOf(context, listen: false);
    final favorites = scope.read(favoriteNotesProvider);
    for (final e in favorites!) {
      if (e.id == widget.notes.id) return true;
    }
    return false;
  }

  void onFavoriteButtonTap() {
    final scope = ProviderScope.containerOf(context, listen: false);
    if (isFavoritePost()) {
      scope.read(favoriteNotesProvider.notifier).removeFavoriteNotes(widget.notes.id);
    } else {
      scope.read(favoriteNotesProvider.notifier).addFavoriteNotes(widget.notes);
    }
    setState(() {
      //no-op
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => onDeleteButtonTap(context),
              icon: AppIcons.delete.svgPicture(),
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: onFavoriteButtonTap,
              icon: isFavoritePost()
                  ? AppIcons.favorite.svgPicture(color: AppColors.primaryColor)
                  : AppIcons.favorite.svgPicture(),
            ),
            IconButton(
              onPressed: widget.onNotesEdit,
              icon: AppIcons.pen.svgPicture(),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(widget.notes.title, style: textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(widget.notes.dateTime, style: textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text(
          widget.notes.note,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
  }
}

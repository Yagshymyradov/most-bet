import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/notes_controller.dart';
import '../../data/notes_model.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';

class NoteDetail extends StatelessWidget {
  final NotesModel notes;
  final VoidCallback onNotesEdit;

  const NoteDetail({
    super.key,
    required this.notes,
    required this.onNotesEdit
  });

  void onDeleteButtonTap(BuildContext context) {
    final scope = ProviderScope.containerOf(context, listen: false);
    final history = scope.read(notesProvider.notifier);
    history.repo?.removeFromNotesList(notes.id);
    Navigator.pop(context);
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
              onPressed: () {},
              icon: AppIcons.favorite.svgPicture(),
            ),
            IconButton(
              onPressed: onNotesEdit,
              icon: AppIcons.pen.svgPicture(),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(notes.title, style: textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(notes.dateTime, style: textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text(
          notes.note,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
  }
}

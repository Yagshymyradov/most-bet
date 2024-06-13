import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/app_bar_widget.dart';
import '../../components/indicators.dart';
import '../../components/modal_bottom_sheet.dart';
import '../../components/note_tile.dart';
import '../../components/small_buttons.dart';
import '../../data/notes_controller.dart';
import '../../data/notes_model.dart';
import '../../l10n/l10n.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';
import 'add_update_notes.dart';
import 'note_detail.dart';

class Notes extends ConsumerStatefulWidget {
  const Notes({super.key});

  @override
  ConsumerState<Notes> createState() => _NotesState();
}

class _NotesState extends ConsumerState<Notes> {
  void updateUi() {
    setState(() {
      //no-op
    });
  }

  void onAddNotesTap() {
    modalBottomSheet(
      context,
      const AddUpdateNotes(),
    ).whenComplete(updateUi);
  }

  void onNotesEdit(NotesModel notes, int index) {
    Navigator.pop(context);

    modalBottomSheet(
      context,
      AddUpdateNotes(notes: notes, index: index),
    ).whenComplete(updateUi);
  }

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(notesProvider.notifier).repo?.getNotesList() ?? [];

    final l10n = context.l10n;
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              AppBarWidget(title: l10n.notes),
              const SizedBox(height: 20),
              if (notes.isEmpty)
                EmptyIndicator(
                  onPressed: onAddNotesTap,
                  title: l10n.addFirstNote,
                )
              else ...[
                Row(
                  children: [
                    SmallButton(title: l10n.all),
                    const SizedBox(width: 8),
                    SmallButton(
                      title: l10n.favorite,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                    ),
                  ],
                ),
                ...notes.mapIndexed(
                  (e, i) => InkWell(
                    onTap: () => modalBottomSheet(
                      context,
                      NoteDetail(
                        notes: e,
                        onNotesEdit: ()=> onNotesEdit(e, i),
                      ),
                    ).whenComplete(() => setState(() {})),
                    child: NoteTile(
                      title: e.title,
                      dateTime: e.dateTime,
                    ),
                  ),
                ),
              ],
            ],
          ),
          Positioned(
            bottom: 18,
            right: 22,
            child: SmallButton(
              onTap: onAddNotesTap,
              title: l10n.addNotes,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/field_text.dart';
import '../../data/notes_controller.dart';
import '../../data/notes_model.dart';
import '../../l10n/l10n.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';

class AddUpdateNotes extends StatefulWidget {
  final NotesModel? notes;
  final int? index;

  const AddUpdateNotes({
    super.key,
    this.notes,
    this.index,
  });

  @override
  State<AddUpdateNotes> createState() => _AddUpdateNotesState();
}

class _AddUpdateNotesState extends State<AddUpdateNotes> {
  final helpYogaController = TextEditingController();
  final dateTimeController = TextEditingController();
  final noteController = TextEditingController();

  void onAddButtonTap() {
    final disableAdd = helpYogaController.text.isEmpty && dateTimeController.text.isEmpty;
    if(disableAdd) return;

    final scope = ProviderScope.containerOf(context, listen: false);
    final notes = scope.read(notesProvider.notifier);

    notes.repo?.addToNotesList(
      NotesModel(
        title: helpYogaController.text,
        dateTime: dateTimeController.text,
        note: noteController.text,
      ),
    );

    Navigator.pop(context);
  }

  void onEditButtonTap() {
    if (widget.index == null) return;
    final scope = ProviderScope.containerOf(context, listen: false);
    final notes = scope.read(notesProvider.notifier);

    notes.repo?.updateNotesList(
      widget.index!,
      NotesModel(
        title: helpYogaController.text,
        dateTime: dateTimeController.text,
        note: noteController.text,
      ),
    );

    setState(() {
      //no-op
    });
    Navigator.pop(context);
  }

  void initialValues() {
    final note = widget.notes;
    if (note == null) return;

    helpYogaController.text = note.title;
    dateTimeController.text = note.dateTime;
    noteController.text = note.note;
  }

  @override
  void initState() {
    super.initState();
    initialValues();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final bool updateNote = widget.notes != null && widget.index != null;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40),
            Text(
              updateNote ? l10n.editNote : l10n.addNotes,
              style: textTheme.headlineMedium?.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            if (updateNote) IconButton(
              onPressed: onEditButtonTap,
              icon: AppIcons.tick.svgPicture(),
            ) else IconButton(
              onPressed: onAddButtonTap,
              icon: AppIcons.add.svgPicture(),
            ),
          ],
        ),
        const SizedBox(height: 10),
        FieldText(
          hintText: l10n.helpForYoga,
          controller: helpYogaController,
        ),
        const SizedBox(height: 16),
        FieldText(
          hintText: l10n.chooseDate,
          controller: dateTimeController,
        ),
        const SizedBox(height: 16),
        FieldText(
          hintText: l10n.notes,
          maxLines: null,
          controller: noteController,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

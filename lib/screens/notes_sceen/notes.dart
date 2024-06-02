import 'package:flutter/material.dart';

import '../../components/app_bar_widget.dart';
import '../../components/modal_bottom_sheet.dart';
import '../../components/note_tile.dart';
import '../../components/small_buttons.dart';
import '../../l10n/l10n.dart';
import '../../utils/theme/theme.dart';
import 'add_notes.dart';
import 'note_detail.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              AppBarWidget(title: l10n.notes),
              const SizedBox(height: 20),
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
              InkWell(
                onTap: () => modalBottomSheet(
                  context,
                  const NoteDetail(),
                ).whenComplete(() => setState(() {})),
                child: const NoteTile(),
              ),
              const NoteTile(),
              const NoteTile(),
            ],
          ),
          Positioned(
            bottom: 18,
            right: 22,
            child: SmallButton(
              onTap: () => modalBottomSheet(
                context,
                const AddNotes(),
              ).whenComplete(() => setState(() {})),
              title: l10n.addNotes,
            ),
          ),
        ],
      ),
    );
  }
}

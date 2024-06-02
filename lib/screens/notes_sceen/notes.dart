import 'package:flutter/material.dart';

import '../../components/app_bar_widget.dart';
import '../../components/modal_bottom_sheet.dart';
import '../../components/small_buttons.dart';
import '../../l10n/l10n.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';
import 'add_notes.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
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
              const SizedBox(height: 16),
              Text(
                'Help for yoga',
                style: textTheme.titleMedium,
              ),
              Text(
                '20.01.2024',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 6),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                'Help for yoga',
                style: textTheme.titleMedium,
              ),
              Text(
                '20.01.2024',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 6),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                'Help for yoga',
                style: textTheme.titleMedium,
              ),
              Text(
                '20.01.2024',
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 6),
              const Divider(),
              const SizedBox(height: 16),
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

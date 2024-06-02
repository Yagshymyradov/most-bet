import 'package:flutter/material.dart';

import '../../components/field_text.dart';
import '../../l10n/l10n.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final helpYogaController = TextEditingController();
  final dateTimeController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40),
            Text(
              l10n.addNotes,
              style: textTheme.headlineMedium?.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: AppIcons.add.svgPicture(),
            ),
          ],
        ),
        const SizedBox(height: 10),
        FieldText(
          hintText: 'Help for yoga',
          controller: helpYogaController,
        ),
        const SizedBox(height: 16),
        FieldText(
          hintText: 'Date',
          controller: dateTimeController,
        ),
        const SizedBox(height: 16),
        FieldText(
          hintText: 'Note',
          maxLines: null,
          controller: noteController,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

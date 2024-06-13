import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';

class NoteDetail extends StatelessWidget {
  final String title;
  final String dateTime;
  final String note;

  const NoteDetail({
    super.key,
    required this.title,
    required this.dateTime,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: AppIcons.delete.svgPicture(),
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
              icon: AppIcons.favorite.svgPicture(),
            ),
            IconButton(
              onPressed: () {},
              icon: AppIcons.pen.svgPicture(),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text(title, style: textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(dateTime, style: textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text(
          note,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
  }
}

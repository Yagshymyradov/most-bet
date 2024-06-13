import 'package:flutter/material.dart';

import '../utils/extensions.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final String dateTime;

  const NoteTile({
    super.key,
    required this.title,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: textTheme.titleMedium,
        ),
        Text(
          dateTime,
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 6),
        const Divider(),
      ],
    );
  }
}

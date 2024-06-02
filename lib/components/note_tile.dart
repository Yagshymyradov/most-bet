import 'package:flutter/material.dart';

import '../utils/extensions.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}

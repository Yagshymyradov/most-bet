import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../utils/extensions.dart';

class EmptyIndicator extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const EmptyIndicator({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Column(
      children: [
        const SizedBox(height: 134),
        Text(
          title,
          textAlign: TextAlign.center,
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: ()=> onPressed!(),
          child: Text(l10n.add, style: textTheme.titleSmall),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/extensions.dart';
import '../utils/theme/theme.dart';

class SmallButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color backgroundColor;

  const SmallButton({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(23),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 8,
          ),
          child: Text(
            title,
            style: textTheme.headlineMedium?.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

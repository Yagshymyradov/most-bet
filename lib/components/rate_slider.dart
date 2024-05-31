import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../utils/extensions.dart';
import '../utils/theme/theme.dart';

class RateSlider extends StatelessWidget {
  final String title;
  final double value;
  final void Function(double) onChanged;

  const RateSlider({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(title, style: textTheme.headlineMedium),
        ),
        const SizedBox(height: 8),
        Slider(
          max: 10,
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryColor,
          inactiveColor: AppColors.textSecondaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value.toStringAsFixed(0)),
              Text(
                l10n.ten,
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

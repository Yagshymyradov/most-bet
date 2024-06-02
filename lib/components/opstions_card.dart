import 'package:flutter/material.dart';
import '../utils/extensions.dart';
import '../utils/theme/theme.dart';

class OptionsCard extends StatelessWidget {
  final String title;
  final Widget icons;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const OptionsCard({
    super.key,
    required this.title,
    required this.icons,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.primaryColor),
          color: backgroundColor,
        ),
        child: SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icons,
                Text(
                  title,
                  style: textTheme.headlineMedium?.copyWith(
                    color: backgroundColor != null //
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
